// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_api_playground/src/service/api/endpoint.dart';
import 'package:twitter_api_playground/src/service/model/endpoint_schema.dart';

part 'service_schema.freezed.dart';
part 'service_schema.g.dart';

@freezed
class ServiceSchema with _$ServiceSchema {
  // ignore: unused_element
  const ServiceSchema._();

  const factory ServiceSchema({
    required List<EndpointSchema> tweets,
    required List<EndpointSchema> users,
  }) = _ServiceSchema;

  factory ServiceSchema.fromJson(Map<String, Object?> json) =>
      _$ServiceSchemaFromJson(json);

  EndpointSchema endpointOf(final Endpoint endpoint) {
    for (final endpointSchema in <EndpointSchema>[...tweets, ...users]) {
      if (endpoint == endpointSchema.endpoint) {
        return endpointSchema;
      }
    }

    throw UnsupportedError('Unsupported value [$endpoint].');
  }
}
