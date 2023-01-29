// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:twitter_api_playground/src/service/api/endpoint.dart';
import 'package:twitter_api_playground/src/service/api/request_sender.dart';
import 'package:twitter_api_playground/src/service/api/service.dart';
import 'package:twitter_api_playground/src/service/components/playground_datetime_picker.dart';
import 'package:twitter_api_playground/src/service/components/playground_dropdown_button.dart';
import 'package:twitter_api_playground/src/service/components/playground_picklist.dart';
import 'package:twitter_api_playground/src/service/components/playground_scaffold.dart';
import 'package:twitter_api_playground/src/service/components/playground_text_field.dart';
import 'package:twitter_api_playground/src/service/model/parameter_schema.dart';
import 'package:twitter_api_playground/src/service/model/parameter_schema_type.dart';
import 'package:twitter_api_playground/src/service/model/service_schema.dart';
import 'package:twitter_api_playground/src/service/view/response/response_page.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart' as oauth2;

import '../../model/expansion_type.dart';

const _clientId = String.fromEnvironment('PLAYGROUND_CLIENT_ID');
const _clientSecret = String.fromEnvironment('PLAYGROUND_CLIENT_SECRET');
const _oauthRedirectUri = String.fromEnvironment('PLAYGROUND_REDIRECT_URI');
const _oauthRedirectUriScheme =
    String.fromEnvironment('PLAYGROUND_REDIRECT_URI_SCHEME');

final _serviceProvider =
    StateNotifierProvider<_ServiceNotifier, Service>((ref) {
  return _ServiceNotifier();
});

class _ServiceNotifier extends StateNotifier<Service> {
  _ServiceNotifier() : super(Service.tweets);

  void update(final Service service) => state = service;
}

final _endpointProvider =
    StateNotifierProvider<_EndpointNotifier, Endpoint>((ref) {
  return _EndpointNotifier();
});

class _EndpointNotifier extends StateNotifier<Endpoint> {
  _EndpointNotifier() : super(Endpoint.tweetsSearchRecent);

  void update(final Endpoint endpoint) => state = endpoint;
}

final _refreshTokenProvider =
    StateNotifierProvider<_RefreshTokenNotifier, String>((ref) {
  return _RefreshTokenNotifier();
});

class _RefreshTokenNotifier extends StateNotifier<String> {
  _RefreshTokenNotifier() : super('');

  void update(final String refreshToken) => state = refreshToken;
  void clear() => state = '';
}

final _oAuth2ScopesProvider =
    StateNotifierProvider<_OAuth2ScopesNotifier, List<oauth2.Scope>>((ref) {
  return _OAuth2ScopesNotifier();
});

class _OAuth2ScopesNotifier extends StateNotifier<List<oauth2.Scope>> {
  _OAuth2ScopesNotifier()
      : super([
          oauth2.Scope.tweetRead,
          oauth2.Scope.usersRead,
        ]);

  void update(final List<oauth2.Scope> scopes) => state = scopes;
}

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
            ref.watch(_endpointProvider),
            _controllers.map((key, value) => MapEntry(key, value.text)),
          )
              .execute(onRetry: (error) {
                // TODO: Do something on retry.
              })
              .then(
                (response) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponsePage(
                      response: response,
                    ),
                  ),
                ),
              )
              .catchError((error) {});
        },
        tooltip: 'Send Request',
        child: const Icon(Icons.send),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: PlaygroundDropdownButton(
              endpoint: ref.watch(_endpointProvider),
              items: _buildDropdownMenuItems(ref),
              onChanged: (endpoint) {
                ref.read(_refreshTokenProvider.notifier).clear();
                ref.read(_endpointProvider.notifier).update(endpoint!);
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
    _controllers.removeWhere((key, value) => true);

    final inputFields = <Widget>[];
    final endpointSchema = _schema.endpointOf(ref.watch(_endpointProvider));

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
              items: _getPicklistItems(endpointSchema.expansionType, parameter),
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
            ref.read(_refreshTokenProvider.notifier).clear();
            ref.read(_serviceProvider.notifier).update(service);
            ref
                .read(_endpointProvider.notifier)
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
    final service = ref.watch(_serviceProvider);

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
    assert(_clientId.isNotEmpty);
    assert(_clientSecret.isNotEmpty);
    assert(_oauthRedirectUri.isNotEmpty);
    assert(_oauthRedirectUriScheme.isNotEmpty);

    if (ref.watch(_refreshTokenProvider).isEmpty) {
      final oauthClient = oauth2.TwitterOAuth2Client(
        clientId: _clientId,
        clientSecret: _clientSecret,
        redirectUri: _oauthRedirectUri,
        customUriScheme: _oauthRedirectUriScheme,
      );

      final response = await oauthClient.executeAuthCodeFlowWithPKCE(
        scopes: oauth2.Scope.values,
      );

      ref.read(_refreshTokenProvider.notifier).update(response.refreshToken!);

      return response.accessToken;
    }

    final refreshedResponse = await OAuthUtils.refreshAccessToken(
      clientId: _clientId,
      clientSecret: _clientSecret,
      refreshToken: ref.watch(_refreshTokenProvider),
    );

    ref
        .read(_refreshTokenProvider.notifier)
        .update(refreshedResponse.refreshToken);

    return refreshedResponse.accessToken;
  }
}
