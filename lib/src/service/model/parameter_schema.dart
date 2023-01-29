// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_api_playground/src/service/model/parameter_schema_type.dart';

part 'parameter_schema.freezed.dart';
part 'parameter_schema.g.dart';

@freezed
class ParameterSchema with _$ParameterSchema {
  const factory ParameterSchema({
    required String name,
    required ParameterSchemaType type,
    @JsonKey(name: 'required') required bool isRequired,
  }) = _ParameterSchema;

  factory ParameterSchema.fromJson(Map<String, Object?> json) =>
      _$ParameterSchemaFromJson(json);
}
