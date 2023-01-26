// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schema _$SchemaFromJson(Map<String, dynamic> json) {
  return _Schema.fromJson(json);
}

/// @nodoc
mixin _$Schema {
  ExpansionType get expansionType => throw _privateConstructorUsedError;
  List<SchemaField> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchemaCopyWith<Schema> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemaCopyWith<$Res> {
  factory $SchemaCopyWith(Schema value, $Res Function(Schema) then) =
      _$SchemaCopyWithImpl<$Res, Schema>;
  @useResult
  $Res call({ExpansionType expansionType, List<SchemaField> fields});
}

/// @nodoc
class _$SchemaCopyWithImpl<$Res, $Val extends Schema>
    implements $SchemaCopyWith<$Res> {
  _$SchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expansionType = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      expansionType: null == expansionType
          ? _value.expansionType
          : expansionType // ignore: cast_nullable_to_non_nullable
              as ExpansionType,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<SchemaField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchemaCopyWith<$Res> implements $SchemaCopyWith<$Res> {
  factory _$$_SchemaCopyWith(_$_Schema value, $Res Function(_$_Schema) then) =
      __$$_SchemaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExpansionType expansionType, List<SchemaField> fields});
}

/// @nodoc
class __$$_SchemaCopyWithImpl<$Res>
    extends _$SchemaCopyWithImpl<$Res, _$_Schema>
    implements _$$_SchemaCopyWith<$Res> {
  __$$_SchemaCopyWithImpl(_$_Schema _value, $Res Function(_$_Schema) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expansionType = null,
    Object? fields = null,
  }) {
    return _then(_$_Schema(
      expansionType: null == expansionType
          ? _value.expansionType
          : expansionType // ignore: cast_nullable_to_non_nullable
              as ExpansionType,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<SchemaField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schema implements _Schema {
  const _$_Schema(
      {required this.expansionType, required final List<SchemaField> fields})
      : _fields = fields;

  factory _$_Schema.fromJson(Map<String, dynamic> json) =>
      _$$_SchemaFromJson(json);

  @override
  final ExpansionType expansionType;
  final List<SchemaField> _fields;
  @override
  List<SchemaField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'Schema(expansionType: $expansionType, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schema &&
            (identical(other.expansionType, expansionType) ||
                other.expansionType == expansionType) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, expansionType, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchemaCopyWith<_$_Schema> get copyWith =>
      __$$_SchemaCopyWithImpl<_$_Schema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchemaToJson(
      this,
    );
  }
}

abstract class _Schema implements Schema {
  const factory _Schema(
      {required final ExpansionType expansionType,
      required final List<SchemaField> fields}) = _$_Schema;

  factory _Schema.fromJson(Map<String, dynamic> json) = _$_Schema.fromJson;

  @override
  ExpansionType get expansionType;
  @override
  List<SchemaField> get fields;
  @override
  @JsonKey(ignore: true)
  _$$_SchemaCopyWith<_$_Schema> get copyWith =>
      throw _privateConstructorUsedError;
}
