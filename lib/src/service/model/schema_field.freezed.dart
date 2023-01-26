// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchemaField _$SchemaFieldFromJson(Map<String, dynamic> json) {
  return _SchemaField.fromJson(json);
}

/// @nodoc
mixin _$SchemaField {
  String get name => throw _privateConstructorUsedError;
  SchemaFieldType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'required')
  bool get isRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchemaFieldCopyWith<SchemaField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemaFieldCopyWith<$Res> {
  factory $SchemaFieldCopyWith(
          SchemaField value, $Res Function(SchemaField) then) =
      _$SchemaFieldCopyWithImpl<$Res, SchemaField>;
  @useResult
  $Res call(
      {String name,
      SchemaFieldType type,
      @JsonKey(name: 'required') bool isRequired});
}

/// @nodoc
class _$SchemaFieldCopyWithImpl<$Res, $Val extends SchemaField>
    implements $SchemaFieldCopyWith<$Res> {
  _$SchemaFieldCopyWithImpl(this._value, this._then);

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
              as SchemaFieldType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchemaFieldCopyWith<$Res>
    implements $SchemaFieldCopyWith<$Res> {
  factory _$$_SchemaFieldCopyWith(
          _$_SchemaField value, $Res Function(_$_SchemaField) then) =
      __$$_SchemaFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      SchemaFieldType type,
      @JsonKey(name: 'required') bool isRequired});
}

/// @nodoc
class __$$_SchemaFieldCopyWithImpl<$Res>
    extends _$SchemaFieldCopyWithImpl<$Res, _$_SchemaField>
    implements _$$_SchemaFieldCopyWith<$Res> {
  __$$_SchemaFieldCopyWithImpl(
      _$_SchemaField _value, $Res Function(_$_SchemaField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
  }) {
    return _then(_$_SchemaField(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SchemaFieldType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchemaField implements _SchemaField {
  const _$_SchemaField(
      {required this.name,
      required this.type,
      @JsonKey(name: 'required') required this.isRequired});

  factory _$_SchemaField.fromJson(Map<String, dynamic> json) =>
      _$$_SchemaFieldFromJson(json);

  @override
  final String name;
  @override
  final SchemaFieldType type;
  @override
  @JsonKey(name: 'required')
  final bool isRequired;

  @override
  String toString() {
    return 'SchemaField(name: $name, type: $type, isRequired: $isRequired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchemaField &&
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
  _$$_SchemaFieldCopyWith<_$_SchemaField> get copyWith =>
      __$$_SchemaFieldCopyWithImpl<_$_SchemaField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchemaFieldToJson(
      this,
    );
  }
}

abstract class _SchemaField implements SchemaField {
  const factory _SchemaField(
          {required final String name,
          required final SchemaFieldType type,
          @JsonKey(name: 'required') required final bool isRequired}) =
      _$_SchemaField;

  factory _SchemaField.fromJson(Map<String, dynamic> json) =
      _$_SchemaField.fromJson;

  @override
  String get name;
  @override
  SchemaFieldType get type;
  @override
  @JsonKey(name: 'required')
  bool get isRequired;
  @override
  @JsonKey(ignore: true)
  _$$_SchemaFieldCopyWith<_$_SchemaField> get copyWith =>
      throw _privateConstructorUsedError;
}
