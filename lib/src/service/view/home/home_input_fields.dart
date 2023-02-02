// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/schema/enum_schema.dart';
import '../../../core/schema/model/expansion_type.dart';
import '../../../core/schema/model/parameter_schema.dart';
import '../../../core/schema/model/parameter_schema_type.dart';
import '../../../core/schema/model/service_schema.dart';
import '../../components/playground_datetime_picker.dart';
import '../../components/playground_picklist.dart';
import '../../components/playground_radio_list.dart';
import '../../components/playground_text_field.dart';

class PlaygroundInputFields extends ConsumerWidget {
  const PlaygroundInputFields({
    super.key,
    required ServiceSchema schema,
    required Map<String, TextEditingController> controllers,
  })  : _schema = schema,
        _controllers = controllers;

  final ServiceSchema _schema;
  final Map<String, TextEditingController> _controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: _buildInputFields(context, ref),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInputFields(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    _controllers.clear();

    final endpointSchema = _schema.endpointOf(
      ref.watch(endpointStateProvider),
    );

    final inputFields = <Widget>[];
    for (final parameter in endpointSchema.parameters) {
      final fieldName = parameter.name;
      final controller = TextEditingController();

      _controllers[fieldName] = controller;

      switch (parameter.type) {
        case ParameterSchemaType.string:
        case ParameterSchemaType.integer:
          inputFields.add(
            PlaygroundTextField(
              controller: controller,
              labelText:
                  parameter.isRequired ? '$fieldName (required)' : fieldName,
            ),
          );

          break;
        case ParameterSchemaType.boolean:
          inputFields.add(
            PlaygroundRadioList(
              controller: controller,
              labelText: fieldName,
              items: const ['true', 'false'],
            ),
          );

          break;
        case ParameterSchemaType.radio:
          final items = _getDropdownItems(fieldName);

          inputFields.add(
            PlaygroundRadioList(
              controller: controller,
              labelText: fieldName,
              items: items,
            ),
          );

          break;
        case ParameterSchemaType.picklist:
          inputFields.add(
            PlaygroundPicklist(
              title: fieldName,
              controller: controller,
              labelText: fieldName,
              items: _getPicklistItems(
                endpointSchema.expansionType,
                parameter,
              ),
            ),
          );

          break;
        case ParameterSchemaType.datetime:
          inputFields.add(
            PlaygroundDatetimePicker(
              controller: controller,
              labelText: fieldName,
            ),
          );

          break;
      }
    }

    return inputFields;
  }

  List<String> _getDropdownItems(final String fieldName) =>
      enumSchema[fieldName]!.map((e) => e.value).toList();

  List<MultiSelectItem> _getPicklistItems(
    final ExpansionType expansionType,
    final ParameterSchema parameter,
  ) {
    if (parameter.name == 'expansions') {
      return _buildMultiSelectItems(
        enumSchema['${expansionType.name}.${parameter.name}']!,
      );
    }

    return _buildMultiSelectItems(
      enumSchema[parameter.name]!,
    );
  }

  List<MultiSelectItem> _buildMultiSelectItems(
    final List<Serializable> values,
  ) =>
      values.map((value) => MultiSelectItem(value.value, value.value)).toList();
}
