// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:twitter_api_v2/twitter_api_v2.dart';

class HeadersTab extends StatelessWidget {
  /// Returns the new instance of [HeadersTab].
  const HeadersTab({
    super.key,
    required this.response,
  });

  /// JSON encoder.
  static const _jsonEncoder = JsonEncoder.withIndent('  ');

  /// Response from Twitter API server.
  final TwitterResponse response;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: SelectableText(
          _jsonEncoder.convert(
            response.headers,
          ),
        ),
      );
}
