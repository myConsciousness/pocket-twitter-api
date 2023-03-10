// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import '../../core/font/font.dart';

final navigationCurrentIndexProvider =
    StateNotifierProvider<_NavigationCurrentIndexNotifier, int>((ref) {
  return _NavigationCurrentIndexNotifier();
});

class _NavigationCurrentIndexNotifier extends StateNotifier<int> {
  _NavigationCurrentIndexNotifier() : super(0);

  void update(final int index) => state = index;
}

class PlaygroundScaffold extends ConsumerWidget {
  /// Returns the new instance of [PlaygroundScaffold].
  const PlaygroundScaffold({
    super.key,
    this.drawer,
    this.navigationBarItems,
    this.floatingActionButton,
    required this.body,
  });

  final Widget? drawer;
  final List<BottomNavigationBarItem>? navigationBarItems;
  final Widget? floatingActionButton;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pocket Twitter API',
          style: TextStyle(
            fontFamily: Font.pico.fontFamily,
            color: Colors.blue,
          ),
        ),
      ),
      drawer: drawer != null ? Drawer(child: drawer) : null,
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: body,
      ),
      bottomNavigationBar: navigationBarItems != null
          ? BottomNavigationBar(
              items: navigationBarItems!,
              currentIndex: ref.watch(navigationCurrentIndexProvider),
              onTap: (int index) {
                ref.read(navigationCurrentIndexProvider.notifier).update(index);
              },
            )
          : null,
    );
  }
}
