// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'service_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceSchema _$$_ServiceSchemaFromJson(Map json) => $checkedCreate(
      r'_$_ServiceSchema',
      json,
      ($checkedConvert) {
        final val = _$_ServiceSchema(
          tweets: $checkedConvert(
              'tweets',
              (v) => (v as List<dynamic>)
                  .map((e) => EndpointSchema.fromJson(
                      Map<String, Object?>.from(e as Map)))
                  .toList()),
          users: $checkedConvert(
              'users',
              (v) => (v as List<dynamic>)
                  .map((e) => EndpointSchema.fromJson(
                      Map<String, Object?>.from(e as Map)))
                  .toList()),
          lists: $checkedConvert(
              'lists',
              (v) => (v as List<dynamic>)
                  .map((e) => EndpointSchema.fromJson(
                      Map<String, Object?>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_ServiceSchemaToJson(_$_ServiceSchema instance) =>
    <String, dynamic>{
      'tweets': instance.tweets.map((e) => e.toJson()).toList(),
      'users': instance.users.map((e) => e.toJson()).toList(),
      'lists': instance.lists.map((e) => e.toJson()).toList(),
    };
