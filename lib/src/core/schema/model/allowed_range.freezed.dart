// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allowed_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllowedRange _$AllowedRangeFromJson(Map<String, dynamic> json) {
  return _AllowedRange.fromJson(json);
}

/// @nodoc
mixin _$AllowedRange {
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllowedRangeCopyWith<AllowedRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllowedRangeCopyWith<$Res> {
  factory $AllowedRangeCopyWith(
          AllowedRange value, $Res Function(AllowedRange) then) =
      _$AllowedRangeCopyWithImpl<$Res, AllowedRange>;
  @useResult
  $Res call({int start, int end});
}

/// @nodoc
class _$AllowedRangeCopyWithImpl<$Res, $Val extends AllowedRange>
    implements $AllowedRangeCopyWith<$Res> {
  _$AllowedRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllowedRangeCopyWith<$Res>
    implements $AllowedRangeCopyWith<$Res> {
  factory _$$_AllowedRangeCopyWith(
          _$_AllowedRange value, $Res Function(_$_AllowedRange) then) =
      __$$_AllowedRangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int end});
}

/// @nodoc
class __$$_AllowedRangeCopyWithImpl<$Res>
    extends _$AllowedRangeCopyWithImpl<$Res, _$_AllowedRange>
    implements _$$_AllowedRangeCopyWith<$Res> {
  __$$_AllowedRangeCopyWithImpl(
      _$_AllowedRange _value, $Res Function(_$_AllowedRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_AllowedRange(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllowedRange implements _AllowedRange {
  const _$_AllowedRange({required this.start, required this.end});

  factory _$_AllowedRange.fromJson(Map<String, dynamic> json) =>
      _$$_AllowedRangeFromJson(json);

  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'AllowedRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllowedRange &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllowedRangeCopyWith<_$_AllowedRange> get copyWith =>
      __$$_AllowedRangeCopyWithImpl<_$_AllowedRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllowedRangeToJson(
      this,
    );
  }
}

abstract class _AllowedRange implements AllowedRange {
  const factory _AllowedRange(
      {required final int start, required final int end}) = _$_AllowedRange;

  factory _AllowedRange.fromJson(Map<String, dynamic> json) =
      _$_AllowedRange.fromJson;

  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$_AllowedRangeCopyWith<_$_AllowedRange> get copyWith =>
      throw _privateConstructorUsedError;
}
