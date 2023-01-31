// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'allowed_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllowedRange _$$_AllowedRangeFromJson(Map json) => $checkedCreate(
      r'_$_AllowedRange',
      json,
      ($checkedConvert) {
        final val = _$_AllowedRange(
          start: $checkedConvert('start', (v) => v as int),
          end: $checkedConvert('end', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_AllowedRangeToJson(_$_AllowedRange instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
