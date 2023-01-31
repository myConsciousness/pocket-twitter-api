// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'allowed_range.freezed.dart';
part 'allowed_range.g.dart';

@freezed
class AllowedRange with _$AllowedRange {
  const factory AllowedRange({
    required int start,
    required int end,
  }) = _AllowedRange;

  factory AllowedRange.fromJson(Map<String, Object?> json) =>
      _$AllowedRangeFromJson(json);
}
