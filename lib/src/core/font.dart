// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum Font {
  /// `Fira Code`
  firaCode('FiraCode'),

  /// `Pico`
  pico('Pico');

  /// The font family.
  final String fontFamily;

  const Font(this.fontFamily);
}
