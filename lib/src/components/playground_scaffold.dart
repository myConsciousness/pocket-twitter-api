// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter/material.dart';

import '../core/font.dart';

class PlaygroundScaffold extends StatelessWidget {
  /// Returns the new instance of [PlaygroundScaffold].
  const PlaygroundScaffold({
    super.key,
    this.drawer,
    this.floatingActionButton,
    required this.body,
  });

  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Twitter API Playground',
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
    );
  }
}
