// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'schema_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchemaField _$$_SchemaFieldFromJson(Map json) => $checkedCreate(
      r'_$_SchemaField',
      json,
      ($checkedConvert) {
        final val = _$_SchemaField(
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$SchemaFieldTypeEnumMap, v)),
          isRequired: $checkedConvert('required', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isRequired': 'required'},
    );

Map<String, dynamic> _$$_SchemaFieldToJson(_$_SchemaField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$SchemaFieldTypeEnumMap[instance.type]!,
      'required': instance.isRequired,
    };

const _$SchemaFieldTypeEnumMap = {
  SchemaFieldType.string: 'string',
  SchemaFieldType.integer: 'integer',
  SchemaFieldType.radio: 'radio',
  SchemaFieldType.picklist: 'picklist',
  SchemaFieldType.datetime: 'datetime',
};
