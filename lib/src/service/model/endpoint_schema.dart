// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_api_playground/src/service/api/endpoint.dart';
import 'package:twitter_api_playground/src/service/model/expansion_type.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

import 'parameter_schema.dart';

part 'endpoint_schema.freezed.dart';
part 'endpoint_schema.g.dart';

@freezed
class EndpointSchema with _$EndpointSchema {
  const factory EndpointSchema({
    @_EndpointConverter() required Endpoint endpoint,
    required ExpansionType expansionType,
    @_ScopeConverter() required List<Scope> scopes,
    required List<ParameterSchema> parameters,
  }) = _EndpointSchema;

  factory EndpointSchema.fromJson(Map<String, Object?> json) =>
      _$EndpointSchemaFromJson(json);
}

class _EndpointConverter implements JsonConverter<Endpoint, String> {
  const _EndpointConverter();

  @override
  Endpoint fromJson(String json) =>
      Endpoint.values.firstWhere((element) => element.unencodedUrl == json);

  @override
  String toJson(Endpoint object) => object.unencodedUrl;
}

class _ScopeConverter implements JsonConverter<Scope, String> {
  const _ScopeConverter();

  @override
  Scope fromJson(String json) => Scope.valueOf(json);

  @override
  String toJson(Scope object) => object.value;
}
