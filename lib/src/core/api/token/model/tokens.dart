// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens.freezed.dart';

@freezed
class Tokens with _$Tokens {
  const factory Tokens({
    required String clientId,
    required String clientSecret,
    required String redirectUri,
    required String customUriScheme,
  }) = _Tokens;
}
