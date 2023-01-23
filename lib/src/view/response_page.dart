// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter_api_playground/src/components/playground_scaffold.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class ResponsePage extends StatelessWidget {
  /// Returns the new instance of [ResponsePage].
  const ResponsePage({
    super.key,
    required this.response,
  });

  /// JSON encoder.
  static const _jsonEncoder = JsonEncoder.withIndent(' ');

  /// Response from Twitter API server.
  final TwitterResponse response;

  @override
  Widget build(BuildContext context) => PlaygroundScaffold(
        body: SingleChildScrollView(
          child: SelectableText(
            _jsonEncoder.convert(
              response.toJson(),
            ),
          ),
        ),
      );
}
