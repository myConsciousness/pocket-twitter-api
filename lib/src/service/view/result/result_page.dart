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
import 'info_tab.dart';
import 'result_navigation_type.dart';

class ResultPage extends ConsumerWidget {
  /// Returns the new instance of [ResultPage].
  const ResultPage({
    super.key,
    required this.response,
  });

  /// The response from Twitter API server.
  final TwitterResponse response;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PlaygroundScaffold(
        body: Center(
          child: _buildCurrentTab(
            ResultNavigationType.valueOf(
              ref.watch(navigationCurrentIndexProvider),
            ),
          ),
        ),
        navigationBarItems: ResultNavigationType.values
            .map(
              (navigation) => BottomNavigationBarItem(
                icon: navigation.icon,
                label: navigation.label,
              ),
            )
            .toList(),
      );

  Widget _buildCurrentTab(final ResultNavigationType navigation) {
    switch (navigation) {
      case ResultNavigationType.body:
        return BodyTab(response: response);
      case ResultNavigationType.headers:
        return HeadersTab(response: response);
      case ResultNavigationType.info:
        return InfoTab(response: response);
    }
  }
}
