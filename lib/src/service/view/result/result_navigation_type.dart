// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

enum ResultNavigationType {
  body(0, 'Body', Icon(Icons.data_object)),
  headers(1, 'Headers', Icon(Icons.security)),
  info(2, 'Info', Icon(Icons.info));

  /// The value of this tab.
  final int value;

  /// The navigation label.
  final String label;

  /// The navigation icon.
  final Icon icon;

  static ResultNavigationType valueOf(final int value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const ResultNavigationType(this.value, this.label, this.icon);
}
