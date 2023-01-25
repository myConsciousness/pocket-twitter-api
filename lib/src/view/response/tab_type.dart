// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum TabType {
  body(0),
  headers(1),
  rateLimit(2);

  /// The value of this tab.
  final int value;

  static TabType valueOf(final int value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const TabType(this.value);
}
