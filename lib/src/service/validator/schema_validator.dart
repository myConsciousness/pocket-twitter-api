// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import '../../core/schema/model/parameter_schema.dart';
import '../../core/schema/model/parameter_schema_type.dart';
import 'invalid_parameter_exception.dart';

class SchemaValidator {
  /// Returns the new instance of [SchemaValidator].
  const SchemaValidator(
    this.schemata,
    this.parameters,
  );

  /// The schemata for parameters.
  final List<ParameterSchema> schemata;

  /// The parameters for request.
  final Map<String, String> parameters;

  void execute() {
    for (final schema in schemata) {
      final parameter = parameters[schema.name]!;

      if (schema.isRequired) {
        if (parameter.isEmpty) {
          throw InvalidParameterException(
            'Required Parameter',
            '"${schema.name}" is a required parameter.',
          );
        }
      }

      if (schema.type == ParameterSchemaType.integer) {
        final value = int.tryParse(parameter);
        if (value == null) {
          throw InvalidParameterException(
            'Invalid Type',
            '"${schema.name}" is expected to be int.',
          );
        }

        if (value < schema.allowedRange!.start ||
            schema.allowedRange!.end < value) {
          throw InvalidParameterException(
            'Invalid Range',
            '"${schema.name}" is expected to be between '
                '${schema.allowedRange!.start} and '
                '${schema.allowedRange!.end}.',
          );
        }
      }
    }
  }
}
