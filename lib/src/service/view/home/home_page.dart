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
import 'package:twitter_api_playground/src/service/model/schema.dart';
import 'package:twitter_api_playground/src/service/model/schema_field.dart';
import 'package:twitter_api_playground/src/service/view/response/response_page.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

import '../../model/expansion_type.dart';
import '../../model/schema_field_type.dart';

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

class TwitterApiPlayground extends ConsumerWidget {
  TwitterApiPlayground({super.key});

  final _controllers = <String, TextEditingController>{};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlaygroundScaffold(
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: _buildDrawerItems(context, ref),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RequestSender(
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
                ref.read(_endpointProvider.notifier).update(endpoint!);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: rootBundle.loadString(
                    'assets/schema/${ref.watch(_serviceProvider).name}.json',
                  ),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final Map<String, dynamic> schemata = jsonDecode(
                      snapshot.data,
                    );

                    return Column(
                      children: _buildInputFields(
                        context,
                        Schema.fromJson(
                          schemata[ref.watch(_endpointProvider).unencodedUrl],
                        ),
                      ),
                    );
                  },
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
    final Schema schema,
  ) {
    //! Remove all controllers before rebuild.
    _controllers.removeWhere((key, value) => true);

    final inputFields = <Widget>[];

    for (final field in schema.fields) {
      final fieldName = field.name;
      final controller = TextEditingController();

      assert(!_controllers.containsKey(fieldName));
      _controllers[fieldName] = controller;

      switch (field.type) {
        case SchemaFieldType.string:
        case SchemaFieldType.integer:
          inputFields.add(
            PlaygroundTextField(
              controller: controller,
              labelText: fieldName,
            ),
          );

          break;
        case SchemaFieldType.radio:
          break;
        case SchemaFieldType.picklist:
          inputFields.add(
            PlaygroundPicklist(
              title: field.name,
              controller: controller,
              labelText: fieldName,
              items: _getPicklistItems(schema.expansionType, field),
            ),
          );

          break;
        case SchemaFieldType.datetime:
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
    final SchemaField field,
  ) {
    switch (field.name) {
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

    throw UnsupportedError('Unsupported field name [${field.name}].');
  }

  List<MultiSelectItem> _buildMultiSelectItems(final List<String> values) =>
      values.map((value) => MultiSelectItem(value, value)).toList();
}
