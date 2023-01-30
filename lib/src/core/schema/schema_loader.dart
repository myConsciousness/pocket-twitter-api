// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 🌎 Project imports:
import '../schema/model/service_schema.dart';

Future<ServiceSchema> get loadSchema async => ServiceSchema.fromJson(jsonDecode(
      await rootBundle.loadString('assets/schema/schema.json'),
    ));
