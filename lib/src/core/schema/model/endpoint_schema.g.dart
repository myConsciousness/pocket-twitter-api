// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'endpoint_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EndpointSchema _$$_EndpointSchemaFromJson(Map json) => $checkedCreate(
      r'_$_EndpointSchema',
      json,
      ($checkedConvert) {
        final val = _$_EndpointSchema(
          endpoint: $checkedConvert('endpoint',
              (v) => const _EndpointConverter().fromJson(v as String)),
          expansionType: $checkedConvert(
              'expansion_type', (v) => $enumDecode(_$ExpansionTypeEnumMap, v)),
          scopes: $checkedConvert(
              'scopes',
              (v) => (v as List<dynamic>)
                  .map((e) => const _ScopeConverter().fromJson(e as String))
                  .toList()),
          parameters: $checkedConvert(
              'parameters',
              (v) => (v as List<dynamic>)
                  .map((e) => ParameterSchema.fromJson(
                      Map<String, Object?>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'expansionType': 'expansion_type'},
    );

Map<String, dynamic> _$$_EndpointSchemaToJson(_$_EndpointSchema instance) =>
    <String, dynamic>{
      'endpoint': const _EndpointConverter().toJson(instance.endpoint),
      'expansion_type': _$ExpansionTypeEnumMap[instance.expansionType]!,
      'scopes': instance.scopes.map(const _ScopeConverter().toJson).toList(),
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
    };

const _$ExpansionTypeEnumMap = {
  ExpansionType.tweets: 'tweets',
  ExpansionType.users: 'users',
  ExpansionType.lists: 'lists',
};
