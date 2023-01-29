// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'endpoint_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EndpointSchema _$EndpointSchemaFromJson(Map<String, dynamic> json) {
  return _EndpointSchema.fromJson(json);
}

/// @nodoc
mixin _$EndpointSchema {
  @_EndpointConverter()
  Endpoint get endpoint => throw _privateConstructorUsedError;
  ExpansionType get expansionType => throw _privateConstructorUsedError;
  @_ScopeConverter()
  List<Scope> get scopes => throw _privateConstructorUsedError;
  List<ParameterSchema> get parameters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndpointSchemaCopyWith<EndpointSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndpointSchemaCopyWith<$Res> {
  factory $EndpointSchemaCopyWith(
          EndpointSchema value, $Res Function(EndpointSchema) then) =
      _$EndpointSchemaCopyWithImpl<$Res, EndpointSchema>;
  @useResult
  $Res call(
      {@_EndpointConverter() Endpoint endpoint,
      ExpansionType expansionType,
      @_ScopeConverter() List<Scope> scopes,
      List<ParameterSchema> parameters});
}

/// @nodoc
class _$EndpointSchemaCopyWithImpl<$Res, $Val extends EndpointSchema>
    implements $EndpointSchemaCopyWith<$Res> {
  _$EndpointSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
    Object? expansionType = null,
    Object? scopes = null,
    Object? parameters = null,
  }) {
    return _then(_value.copyWith(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
      expansionType: null == expansionType
          ? _value.expansionType
          : expansionType // ignore: cast_nullable_to_non_nullable
              as ExpansionType,
      scopes: null == scopes
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<Scope>,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<ParameterSchema>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EndpointSchemaCopyWith<$Res>
    implements $EndpointSchemaCopyWith<$Res> {
  factory _$$_EndpointSchemaCopyWith(
          _$_EndpointSchema value, $Res Function(_$_EndpointSchema) then) =
      __$$_EndpointSchemaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_EndpointConverter() Endpoint endpoint,
      ExpansionType expansionType,
      @_ScopeConverter() List<Scope> scopes,
      List<ParameterSchema> parameters});
}

/// @nodoc
class __$$_EndpointSchemaCopyWithImpl<$Res>
    extends _$EndpointSchemaCopyWithImpl<$Res, _$_EndpointSchema>
    implements _$$_EndpointSchemaCopyWith<$Res> {
  __$$_EndpointSchemaCopyWithImpl(
      _$_EndpointSchema _value, $Res Function(_$_EndpointSchema) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
    Object? expansionType = null,
    Object? scopes = null,
    Object? parameters = null,
  }) {
    return _then(_$_EndpointSchema(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as Endpoint,
      expansionType: null == expansionType
          ? _value.expansionType
          : expansionType // ignore: cast_nullable_to_non_nullable
              as ExpansionType,
      scopes: null == scopes
          ? _value._scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<Scope>,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<ParameterSchema>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EndpointSchema implements _EndpointSchema {
  const _$_EndpointSchema(
      {@_EndpointConverter() required this.endpoint,
      required this.expansionType,
      @_ScopeConverter() required final List<Scope> scopes,
      required final List<ParameterSchema> parameters})
      : _scopes = scopes,
        _parameters = parameters;

  factory _$_EndpointSchema.fromJson(Map<String, dynamic> json) =>
      _$$_EndpointSchemaFromJson(json);

  @override
  @_EndpointConverter()
  final Endpoint endpoint;
  @override
  final ExpansionType expansionType;
  final List<Scope> _scopes;
  @override
  @_ScopeConverter()
  List<Scope> get scopes {
    if (_scopes is EqualUnmodifiableListView) return _scopes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scopes);
  }

  final List<ParameterSchema> _parameters;
  @override
  List<ParameterSchema> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  String toString() {
    return 'EndpointSchema(endpoint: $endpoint, expansionType: $expansionType, scopes: $scopes, parameters: $parameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EndpointSchema &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.expansionType, expansionType) ||
                other.expansionType == expansionType) &&
            const DeepCollectionEquality().equals(other._scopes, _scopes) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      endpoint,
      expansionType,
      const DeepCollectionEquality().hash(_scopes),
      const DeepCollectionEquality().hash(_parameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EndpointSchemaCopyWith<_$_EndpointSchema> get copyWith =>
      __$$_EndpointSchemaCopyWithImpl<_$_EndpointSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EndpointSchemaToJson(
      this,
    );
  }
}

abstract class _EndpointSchema implements EndpointSchema {
  const factory _EndpointSchema(
      {@_EndpointConverter() required final Endpoint endpoint,
      required final ExpansionType expansionType,
      @_ScopeConverter() required final List<Scope> scopes,
      required final List<ParameterSchema> parameters}) = _$_EndpointSchema;

  factory _EndpointSchema.fromJson(Map<String, dynamic> json) =
      _$_EndpointSchema.fromJson;

  @override
  @_EndpointConverter()
  Endpoint get endpoint;
  @override
  ExpansionType get expansionType;
  @override
  @_ScopeConverter()
  List<Scope> get scopes;
  @override
  List<ParameterSchema> get parameters;
  @override
  @JsonKey(ignore: true)
  _$$_EndpointSchemaCopyWith<_$_EndpointSchema> get copyWith =>
      throw _privateConstructorUsedError;
}
