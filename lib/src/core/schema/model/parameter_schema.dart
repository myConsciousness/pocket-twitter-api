// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import 'allowed_range.dart';
import 'parameter_schema_type.dart';

part 'parameter_schema.freezed.dart';
part 'parameter_schema.g.dart';

@freezed
class ParameterSchema with _$ParameterSchema {
  const factory ParameterSchema({
    required String name,
    required ParameterSchemaType type,
    @JsonKey(name: 'required') required bool isRequired,
    AllowedRange? allowedRange,
  }) = _ParameterSchema;

  factory ParameterSchema.fromJson(Map<String, Object?> json) =>
      _$ParameterSchemaFromJson(json);
}
