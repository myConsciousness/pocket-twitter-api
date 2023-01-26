// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_playground/src/core/font.dart';

import 'src/service/view/home/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Twitter API Playground',
        theme: ThemeData(
          fontFamily: Font.firaCode.fontFamily,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: TwitterApiPlayground(),
      ),
    ),
  );
}
