// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_playground/src/core/font.dart';
import 'package:twitter_api_playground/src/service/model/service_schema.dart';

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
        ),
        debugShowCheckedModeBanner: false,
        home: TwitterApiPlayground(
          schema: ServiceSchema.fromJson(
            jsonDecode(
              await rootBundle.loadString('assets/schema/schema.json'),
            ),
          ),
        ),
      ),
    ),
  );
}
