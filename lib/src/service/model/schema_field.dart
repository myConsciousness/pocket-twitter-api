// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_api_playground/src/service/model/schema_field_type.dart';

part 'schema_field.freezed.dart';
part 'schema_field.g.dart';

@freezed
class SchemaField with _$SchemaField {
  const factory SchemaField({
    required String name,
    required SchemaFieldType type,
    @JsonKey(name: 'required') required bool isRequired,
  }) = _SchemaField;

  factory SchemaField.fromJson(Map<String, Object?> json) =>
      _$SchemaFieldFromJson(json);
}
