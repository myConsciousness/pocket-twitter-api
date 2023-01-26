// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_api_playground/src/service/model/expansion_type.dart';

import 'schema_field.dart';

part 'schema.freezed.dart';
part 'schema.g.dart';

@freezed
class Schema with _$Schema {
  const factory Schema({
    required ExpansionType expansionType,
    required List<SchemaField> fields,
  }) = _Schema;

  factory Schema.fromJson(Map<String, Object?> json) => _$SchemaFromJson(json);
}
