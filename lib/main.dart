// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'src/core/font/font.dart';
import 'src/core/schema/schema_loader.dart';
import 'src/service/view/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Twitter API Playground',
        theme: ThemeData(
          fontFamily: Font.firaCode.fontFamily,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: PlaygroundHomePage(schema: await loadSchema),
      ),
    ),
  );
}
