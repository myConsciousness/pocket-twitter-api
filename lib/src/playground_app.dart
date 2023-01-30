// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/font/font.dart';
import 'core/schema/model/service_schema.dart';
import 'core/theme/brightness.dart';
import 'service/view/home/home_page.dart';

class PlaygroundApp extends ConsumerWidget {
  /// Returns the new instance of [PlaygroundApp].
  const PlaygroundApp({
    super.key,
    required ServiceSchema schema,
  }) : _schema = schema;

  final ServiceSchema _schema;

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        title: 'Twitter API Playground',
        theme: ThemeData(
          fontFamily: Font.firaCode.fontFamily,
          useMaterial3: true,
          brightness: ref.watch(brightnessStateProvider),
        ),
        debugShowCheckedModeBanner: false,
        home: PlaygroundHomePage(schema: _schema),
      );
}
