// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart' as oauth2;

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/api/service.dart';
import '../../../core/api/token/refresh_token_provider.dart';
import '../../../core/api/token/secret_provider.dart';
import '../../../core/schema/model/expansion_type.dart';
import '../../../core/schema/model/parameter_schema.dart';
import '../../../core/schema/model/parameter_schema_type.dart';
import '../../../core/schema/model/service_schema.dart';
import '../../api/request_sender.dart';
import '../../components/playground_datetime_picker.dart';
import '../../components/playground_dropdown_button.dart';
import '../../components/playground_picklist.dart';
import '../../components/playground_scaffold.dart';
import '../../components/playground_text_field.dart';
import '../response/response_page.dart';

class TwitterApiPlayground extends ConsumerWidget {
  TwitterApiPlayground({
    super.key,
    required ServiceSchema schema,
  }) : _schema = schema;

  final _controllers = <String, TextEditingController>{};
  final ServiceSchema _schema;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlaygroundScaffold(
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: _buildDrawerItems(context, ref),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final accessToken = await _fetchAccessToken(ref);

          RequestSender(
            accessToken,
            ref.watch(endpointStateProvider),
            _controllers.map((key, value) => MapEntry(key, value.text)),
          ).execute(onRetry: (error) {
            // TODO: Do something on retry.
          }).then((response) async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResponsePage(
                  response: response,
                ),
              ),
            );
          }).catchError((error) {});
        },
        tooltip: 'Send Request',
        child: const Icon(Icons.send),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: PlaygroundDropdownButton(
              endpoint: ref.watch(endpointStateProvider),
              items: _buildDropdownMenuItems(ref),
              onChanged: (endpoint) {
                ref.read(refreshTokenStateProvider.notifier).clear();
                ref.read(endpointStateProvider.notifier).update(endpoint!);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: _buildInputFields(
                    context,
                    ref,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInputFields(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    //! Remove all controllers before rebuild.
    _controllers.removeWhere((_, __) => true);

    final inputFields = <Widget>[];
    final endpointSchema = _schema.endpointOf(ref.watch(endpointStateProvider));

    for (final parameter in endpointSchema.parameters) {
      final fieldName = parameter.name;
      final controller = TextEditingController();

      assert(!_controllers.containsKey(fieldName));
      _controllers[fieldName] = controller;

      switch (parameter.type) {
        case ParameterSchemaType.string:
        case ParameterSchemaType.integer:
          inputFields.add(
            PlaygroundTextField(
              controller: controller,
              labelText: fieldName,
            ),
          );

          break;
        case ParameterSchemaType.radio:
          break;
        case ParameterSchemaType.picklist:
          inputFields.add(
            PlaygroundPicklist(
              title: fieldName,
              controller: controller,
              labelText: fieldName,
              items: _getPicklistItems(
                endpointSchema.expansionType,
                parameter,
              ),
            ),
          );

          break;
        case ParameterSchemaType.datetime:
          inputFields.add(
            PlaygroundDatetimePicker(
              controller: controller,
              labelText: fieldName,
            ),
          );

          break;
      }
    }

    return inputFields;
  }

  List<Widget> _buildDrawerItems(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    final menuItems = <Widget>[
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
    ];

    for (final service in Service.values) {
      menuItems.add(
        ListTile(
          title: Text(
            service.itemName,
            style: const TextStyle(fontSize: 20),
          ),
          onTap: () {
            ref.read(refreshTokenStateProvider.notifier).clear();
            ref.read(serviceStateProvider.notifier).update(service);
            ref
                .read(endpointStateProvider.notifier)
                .update(Endpoint.of(service).first);

            final snackBar = SnackBar(
              content: Text('Changed to ${service.itemName}.'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            //! Close drawer.
            Navigator.pop(context);
          },
        ),
      );
    }

    return menuItems;
  }

  List<DropdownMenuItem<Endpoint>> _buildDropdownMenuItems(
    final WidgetRef ref,
  ) {
    final menuItems = <DropdownMenuItem<Endpoint>>[];
    final service = ref.watch(serviceStateProvider);

    for (final endpoint in Endpoint.of(service)) {
      menuItems.add(
        DropdownMenuItem(
          value: endpoint,
          child: Text(endpoint.unencodedUrl),
        ),
      );
    }

    return menuItems;
  }

  List<MultiSelectItem> _getPicklistItems(
    final ExpansionType expansionType,
    final ParameterSchema parameter,
  ) {
    switch (parameter.name) {
      case 'expansions':
        switch (expansionType) {
          case ExpansionType.tweets:
            return _buildMultiSelectItems(
              TweetExpansion.values.map((e) => e.value).toList(),
            );
          case ExpansionType.users:
            return _buildMultiSelectItems(
              UserExpansion.values.map((e) => e.value).toList(),
            );
        }
      case 'tweet.fields':
        return _buildMultiSelectItems(
          TweetField.values.map((e) => e.value).toList(),
        );
      case 'user.fields':
        return _buildMultiSelectItems(
          UserField.values.map((e) => e.value).toList(),
        );
      case 'place.fields':
        return _buildMultiSelectItems(
          PlaceField.values.map((e) => e.value).toList(),
        );
      case 'poll.fields':
        return _buildMultiSelectItems(
          PollField.values.map((e) => e.value).toList(),
        );
      case 'media.fields':
        return _buildMultiSelectItems(
          MediaField.values.map((e) => e.value).toList(),
        );
      case 'sort_order':
        return _buildMultiSelectItems(
          SortOrder.values.map((e) => e.value).toList(),
        );
    }

    throw UnsupportedError('Unsupported field name [${parameter.name}].');
  }

  List<MultiSelectItem> _buildMultiSelectItems(final List<String> values) =>
      values.map((value) => MultiSelectItem(value, value)).toList();

  Future<String> _fetchAccessToken(final WidgetRef ref) async {
    final tokens = ref.watch(secretStateProvider);

    if (ref.watch(refreshTokenStateProvider).isEmpty) {
      final oauthClient = oauth2.TwitterOAuth2Client(
        clientId: tokens.clientId,
        clientSecret: tokens.clientSecret,
        redirectUri: tokens.redirectUri,
        customUriScheme: tokens.customUriScheme,
      );

      final response = await oauthClient.executeAuthCodeFlowWithPKCE(
        scopes: [
          oauth2.Scope.offlineAccess,
          ..._schema.endpointOf(ref.watch(endpointStateProvider)).scopes,
        ],
      );

      ref
          .read(refreshTokenStateProvider.notifier)
          .update(response.refreshToken!);

      return response.accessToken;
    }

    final refreshedResponse = await OAuthUtils.refreshAccessToken(
      clientId: tokens.clientId,
      clientSecret: tokens.clientSecret,
      refreshToken: ref.watch(refreshTokenStateProvider),
    );

    ref
        .read(refreshTokenStateProvider.notifier)
        .update(refreshedResponse.refreshToken);

    return refreshedResponse.accessToken;
  }
}
