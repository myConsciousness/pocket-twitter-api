// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../api/endpoint.dart';
import 'endpoint_schema.dart';

part 'service_schema.freezed.dart';
part 'service_schema.g.dart';

@freezed
class ServiceSchema with _$ServiceSchema {
  // ignore: unused_element
  const ServiceSchema._();

  const factory ServiceSchema({
    required List<EndpointSchema> tweets,
    required List<EndpointSchema> users,
    required List<EndpointSchema> lists,
  }) = _ServiceSchema;

  factory ServiceSchema.fromJson(Map<String, Object?> json) =>
      _$ServiceSchemaFromJson(json);

  EndpointSchema endpointOf(final Endpoint endpoint) {
    for (final endpointSchema in <EndpointSchema>[
      ...tweets,
      ...users,
      ...lists
    ]) {
      if (endpoint == endpointSchema.endpoint) {
        return endpointSchema;
      }
    }

    throw UnsupportedError('Unsupported value [$endpoint].');
  }
}
