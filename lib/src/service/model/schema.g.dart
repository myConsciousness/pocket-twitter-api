// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schema _$$_SchemaFromJson(Map json) => $checkedCreate(
      r'_$_Schema',
      json,
      ($checkedConvert) {
        final val = _$_Schema(
          expansionType: $checkedConvert(
              'expansion_type', (v) => $enumDecode(_$ExpansionTypeEnumMap, v)),
          fields: $checkedConvert(
              'fields',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      SchemaField.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'expansionType': 'expansion_type'},
    );

Map<String, dynamic> _$$_SchemaToJson(_$_Schema instance) => <String, dynamic>{
      'expansion_type': _$ExpansionTypeEnumMap[instance.expansionType]!,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

const _$ExpansionTypeEnumMap = {
  ExpansionType.tweets: 'tweets',
  ExpansionType.users: 'users',
};
