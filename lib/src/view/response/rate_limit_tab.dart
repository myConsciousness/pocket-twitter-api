// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter/material.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class RateLimitTab extends StatelessWidget {
  /// Returns the new instance of [HeadersTab].
  const RateLimitTab({
    super.key,
    required this.response,
  });

  /// Response from Twitter API server.
  final TwitterResponse response;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitleText('Limit'),
          _buildContentText('${response.rateLimit.limitCount}'),
          const SizedBox(height: 20),
          _buildTitleText('Remaining'),
          _buildContentText('${response.rateLimit.remainingCount}'),
          const SizedBox(height: 20),
          _buildTitleText('Reset At'),
          _buildContentText('${response.rateLimit.resetAt}'),
        ],
      );

  SelectableText _buildTitleText(final String data) => SelectableText(
        data,
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      );

  SelectableText _buildContentText(final String data) => SelectableText(
        data,
        style: const TextStyle(
          fontSize: 22,
        ),
      );
}
