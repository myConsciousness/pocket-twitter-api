// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

// 🌎 Project imports:
import '../../components/playground_scaffold.dart';
import 'body_tab.dart';
import 'headers_tab.dart';
import 'rate_limit_tab.dart';
import 'tab_type.dart';

class ResponsePage extends ConsumerWidget {
  /// Returns the new instance of [ResponsePage].
  const ResponsePage({
    super.key,
    required this.response,
  });

  /// The response from Twitter API server.
  final TwitterResponse response;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PlaygroundScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SelectableText(
                    '${response.request.method.value} ${response.request.url}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _buildCurrentTab(
                  TabType.valueOf(
                    ref.watch(navigationCurrentIndexProvider),
                  ),
                ),
              ),
            ],
          ),
        ),
        navigationBarItems: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.data_object),
            label: 'Body',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: 'Headers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Rate Limit',
          ),
        ],
      );

  Widget _buildCurrentTab(final TabType tabType) {
    switch (tabType) {
      case TabType.body:
        return BodyTab(response: response);
      case TabType.headers:
        return HeadersTab(response: response);
      case TabType.rateLimit:
        return RateLimitTab(response: response);
    }
  }
}
