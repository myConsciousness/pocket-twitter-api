// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final refreshTokenStateProvider =
    StateNotifierProvider<_RefreshTokenStateNotifier, String>((ref) {
  return _RefreshTokenStateNotifier();
});

class _RefreshTokenStateNotifier extends StateNotifier<String> {
  _RefreshTokenStateNotifier() : super('');

  void update(final String refreshToken) => state = refreshToken;
  void clear() => state = '';
}
