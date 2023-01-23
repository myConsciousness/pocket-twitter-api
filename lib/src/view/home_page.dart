// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_playground/src/api/endpoint.dart';
import 'package:twitter_api_playground/src/api/request_sender.dart';
import 'package:twitter_api_playground/src/components/playground_scaffold.dart';
import 'package:twitter_api_playground/src/components/playground_text_field.dart';
import 'package:twitter_api_playground/src/view/response_page.dart';

class TwitterApiPlayground extends ConsumerWidget {
  TwitterApiPlayground({super.key});

  final _endpoint = Endpoint.tweetsSearchRecent;

  final _fieldNames = ['query', 'max_results'];
  final _controllers = <String, TextEditingController>{};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlaygroundScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await RequestSender(
            _endpoint,
            _controllers.map((key, value) => MapEntry(key, value.text)),
          ).execute();

          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResponsePage(
                response: response,
              ),
            ),
          );
        },
        tooltip: 'Send Request',
        child: const Icon(Icons.send),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _inputFields,
        ),
      ),
    );
  }

  List<Widget> get _inputFields {
    final inputFields = <Widget>[];

    for (final fieldName in _fieldNames) {
      final controller = TextEditingController();
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
}
