// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_playground/src/api/endpoint.dart';
import 'package:twitter_api_playground/src/api/request_sender.dart';
import 'package:twitter_api_playground/src/api/service.dart';
import 'package:twitter_api_playground/src/components/playground_scaffold.dart';
import 'package:twitter_api_playground/src/components/playground_text_field.dart';
import 'package:twitter_api_playground/src/view/response_page.dart';

import '../components/playground_dropdown_button.dart';

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

                    final Map<String, dynamic> schema = jsonDecode(
                      snapshot.data,
                    );

                    return Column(
                      children: _buildInputFields(
                        schema[ref.watch(_endpointProvider).name],
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

  List<Widget> _buildInputFields(final Map<String, dynamic> schema) {
    //! Remove all controllers before rebuild.
    _controllers.removeWhere((key, value) => true);

    final inputFields = <Widget>[];

    for (final field in schema['fields']) {
      final fieldName = field['name'];
      final controller = TextEditingController();

      assert(!_controllers.containsKey(fieldName));
      _controllers[fieldName] = controller;

      inputFields.add(
        PlaygroundTextField(
          controller: controller,
          labelText: fieldName,
        ),
      );
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
}
