// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

class InvalidParameterException implements Exception {
  /// Returns the new instance of [InvalidParameterException].
  const InvalidParameterException(this.title, this.message);

  /// The error title.
  final String title;

  /// The error message.
  final String message;
}
