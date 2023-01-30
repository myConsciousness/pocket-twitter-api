// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart' as oauth2;

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/api/service.dart';
import '../../../core/api/token/refresh_token.dart';
import '../../../core/api/token/secret.dart';
import '../../../core/schema/enum_schema.dart';
import '../../../core/schema/model/expansion_type.dart';
import '../../../core/schema/model/parameter_schema.dart';
import '../../../core/schema/model/parameter_schema_type.dart';
import '../../../core/schema/model/service_schema.dart';
import '../../../core/theme/brightness.dart';
import '../../api/request_sender.dart';
import '../../components/playground_datetime_picker.dart';
import '../../components/playground_dropdown_button.dart';
import '../../components/playground_picklist.dart';
import '../../components/playground_radio_list.dart';
import '../../components/playground_scaffold.dart';
import '../../components/playground_text_field.dart';
import '../result/result_navigation_type.dart';
import '../result/result_page.dart';

class PlaygroundHomePage extends ConsumerWidget {
  PlaygroundHomePage({
    super.key,
    required ServiceSchema schema,
  }) : _schema = schema;

  final _controllers = <String, TextEditingController>{};
  final ServiceSchema _schema;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlaygroundScaffold(
      drawer: _buildDrawerItems(context, ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final accessToken = await _fetchAccessToken(ref);

          RequestSender(
            accessToken,
            ref.watch(endpointStateProvider),
            _controllers.map((key, value) => MapEntry(key, value.text)),
          ).execute(onRetry: (error) {
            // TODO: Do something on retry.
          }).then(
            (response) async {
              ref.read(navigationCurrentIndexProvider.notifier).update(
                    ResultNavigationType.body.value,
                  );

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    response: response,
                  ),
                ),
              );
            },
          ).catchError((error) {});
        },
        tooltip: 'Send Request',
        child: const Icon(Icons.send),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: PlaygroundDropdownButton(
              labelText: 'Endpoint',
              value: ref.watch(endpointStateProvider),
              items: _buildDropdownMenuItems(ref.watch(serviceStateProvider)),
              onChanged: (endpoint) {
                ref.read(refreshTokenStateProvider.notifier).clear();
                ref.read(endpointStateProvider.notifier).update(endpoint);
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: _buildInputFields(context, ref),
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
              labelText:
                  parameter.isRequired ? '$fieldName (required)' : fieldName,
            ),
          );

          break;
        case ParameterSchemaType.radio:
          final items = _getDropdownItems(fieldName);

          inputFields.add(
            PlaygroundRadioList(
              controller: controller,
              labelText: fieldName,
              items: items,
            ),
          );

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

  Widget _buildDrawerItems(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    final menuItems = <Widget>[];

    for (final service in Service.values) {
      menuItems.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              service.itemName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              ref.read(refreshTokenStateProvider.notifier).clear();
              ref.read(serviceStateProvider.notifier).update(service);
              ref
                  .read(endpointStateProvider.notifier)
                  .update(Endpoint.of(service).first);

              final snackBar = SnackBar(
                content: Text(
                  'Changed to ${service.itemName}.',
                  style: const TextStyle(fontSize: 17),
                ),
                showCloseIcon: true,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              //! Close drawer.
              Navigator.pop(context);
            },
          ),
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 50),
        Expanded(
          child: ListView(
            children: menuItems,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              IconButton(
                icon: ref.watch(brightnessStateProvider) == Brightness.dark
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
                onPressed: () {
                  final brightness = ref.watch(brightnessStateProvider);
                  final brightnessNotifier =
                      ref.read(brightnessStateProvider.notifier);

                  brightness == Brightness.dark
                      ? brightnessNotifier.toLightMode()
                      : brightnessNotifier.toDarkMode();
                },
              ),
              IconButton(
                onPressed: () async {
                  await LaunchReview.launch(
                    androidAppId: '',
                    iOSAppId: '',
                  );
                },
                icon: const Icon(Icons.reviews),
              ),
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showLicensePage(context: context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<SelectedListItem> _buildDropdownMenuItems(
    final Service service,
  ) {
    final menuItems = <SelectedListItem>[];

    for (final endpoint in Endpoint.of(service)) {
      final resource = '${endpoint.httpMethod.value} ${endpoint.unencodedUrl}';

      menuItems.add(
        SelectedListItem(
          name: resource,
          value: resource,
        ),
      );
    }

    return menuItems;
  }

  List<String> _getDropdownItems(final String fieldName) =>
      enumSchema[fieldName]!.map((e) => e.value).toList();

  List<MultiSelectItem> _getPicklistItems(
    final ExpansionType expansionType,
    final ParameterSchema parameter,
  ) {
    if (parameter.name == 'expansions') {
      return _buildMultiSelectItems(
        enumSchema['${expansionType.name}.${parameter.name}']!,
      );
    }

    return _buildMultiSelectItems(
      enumSchema[parameter.name]!,
    );
  }

  List<MultiSelectItem> _buildMultiSelectItems(
    final List<Serializable> values,
  ) =>
      values.map((value) => MultiSelectItem(value.value, value.value)).toList();

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
