// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'parameter_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParameterSchema _$$_ParameterSchemaFromJson(Map json) => $checkedCreate(
      r'_$_ParameterSchema',
      json,
      ($checkedConvert) {
        final val = _$_ParameterSchema(
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$ParameterSchemaTypeEnumMap, v)),
          isRequired: $checkedConvert('required', (v) => v as bool),
          allowedRange: $checkedConvert(
              'allowed_range',
              (v) => v == null
                  ? null
                  : AllowedRange.fromJson(Map<String, Object?>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {
        'isRequired': 'required',
        'allowedRange': 'allowed_range'
      },
    );

Map<String, dynamic> _$$_ParameterSchemaToJson(_$_ParameterSchema instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$ParameterSchemaTypeEnumMap[instance.type]!,
      'required': instance.isRequired,
      'allowed_range': instance.allowedRange?.toJson(),
    };

const _$ParameterSchemaTypeEnumMap = {
  ParameterSchemaType.string: 'string',
  ParameterSchemaType.integer: 'integer',
  ParameterSchemaType.radio: 'radio',
  ParameterSchemaType.picklist: 'picklist',
  ParameterSchemaType.datetime: 'datetime',
};
