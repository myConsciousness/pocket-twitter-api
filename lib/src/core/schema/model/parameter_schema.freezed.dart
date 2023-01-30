// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parameter_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParameterSchema _$ParameterSchemaFromJson(Map<String, dynamic> json) {
  return _ParameterSchema.fromJson(json);
}

/// @nodoc
mixin _$ParameterSchema {
  String get name => throw _privateConstructorUsedError;
  ParameterSchemaType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'required')
  bool get isRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParameterSchemaCopyWith<ParameterSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParameterSchemaCopyWith<$Res> {
  factory $ParameterSchemaCopyWith(
          ParameterSchema value, $Res Function(ParameterSchema) then) =
      _$ParameterSchemaCopyWithImpl<$Res, ParameterSchema>;
  @useResult
  $Res call(
      {String name,
      ParameterSchemaType type,
      @JsonKey(name: 'required') bool isRequired});
}

/// @nodoc
class _$ParameterSchemaCopyWithImpl<$Res, $Val extends ParameterSchema>
    implements $ParameterSchemaCopyWith<$Res> {
  _$ParameterSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ParameterSchemaType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParameterSchemaCopyWith<$Res>
    implements $ParameterSchemaCopyWith<$Res> {
  factory _$$_ParameterSchemaCopyWith(
          _$_ParameterSchema value, $Res Function(_$_ParameterSchema) then) =
      __$$_ParameterSchemaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      ParameterSchemaType type,
      @JsonKey(name: 'required') bool isRequired});
}

/// @nodoc
class __$$_ParameterSchemaCopyWithImpl<$Res>
    extends _$ParameterSchemaCopyWithImpl<$Res, _$_ParameterSchema>
    implements _$$_ParameterSchemaCopyWith<$Res> {
  __$$_ParameterSchemaCopyWithImpl(
      _$_ParameterSchema _value, $Res Function(_$_ParameterSchema) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
  }) {
    return _then(_$_ParameterSchema(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ParameterSchemaType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParameterSchema implements _ParameterSchema {
  const _$_ParameterSchema(
      {required this.name,
      required this.type,
      @JsonKey(name: 'required') required this.isRequired});

  factory _$_ParameterSchema.fromJson(Map<String, dynamic> json) =>
      _$$_ParameterSchemaFromJson(json);

  @override
  final String name;
  @override
  final ParameterSchemaType type;
  @override
  @JsonKey(name: 'required')
  final bool isRequired;

  @override
  String toString() {
    return 'ParameterSchema(name: $name, type: $type, isRequired: $isRequired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParameterSchema &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, isRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParameterSchemaCopyWith<_$_ParameterSchema> get copyWith =>
      __$$_ParameterSchemaCopyWithImpl<_$_ParameterSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParameterSchemaToJson(
      this,
    );
  }
}

abstract class _ParameterSchema implements ParameterSchema {
  const factory _ParameterSchema(
          {required final String name,
          required final ParameterSchemaType type,
          @JsonKey(name: 'required') required final bool isRequired}) =
      _$_ParameterSchema;

  factory _ParameterSchema.fromJson(Map<String, dynamic> json) =
      _$_ParameterSchema.fromJson;

  @override
  String get name;
  @override
  ParameterSchemaType get type;
  @override
  @JsonKey(name: 'required')
  bool get isRequired;
  @override
  @JsonKey(ignore: true)
  _$$_ParameterSchemaCopyWith<_$_ParameterSchema> get copyWith =>
      throw _privateConstructorUsedError;
}
