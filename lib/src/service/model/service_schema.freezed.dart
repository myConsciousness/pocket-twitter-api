// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceSchema _$ServiceSchemaFromJson(Map<String, dynamic> json) {
  return _ServiceSchema.fromJson(json);
}

/// @nodoc
mixin _$ServiceSchema {
  List<EndpointSchema> get tweets => throw _privateConstructorUsedError;
  List<EndpointSchema> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceSchemaCopyWith<ServiceSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceSchemaCopyWith<$Res> {
  factory $ServiceSchemaCopyWith(
          ServiceSchema value, $Res Function(ServiceSchema) then) =
      _$ServiceSchemaCopyWithImpl<$Res, ServiceSchema>;
  @useResult
  $Res call({List<EndpointSchema> tweets, List<EndpointSchema> users});
}

/// @nodoc
class _$ServiceSchemaCopyWithImpl<$Res, $Val extends ServiceSchema>
    implements $ServiceSchemaCopyWith<$Res> {
  _$ServiceSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweets = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      tweets: null == tweets
          ? _value.tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as List<EndpointSchema>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EndpointSchema>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceSchemaCopyWith<$Res>
    implements $ServiceSchemaCopyWith<$Res> {
  factory _$$_ServiceSchemaCopyWith(
          _$_ServiceSchema value, $Res Function(_$_ServiceSchema) then) =
      __$$_ServiceSchemaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EndpointSchema> tweets, List<EndpointSchema> users});
}

/// @nodoc
class __$$_ServiceSchemaCopyWithImpl<$Res>
    extends _$ServiceSchemaCopyWithImpl<$Res, _$_ServiceSchema>
    implements _$$_ServiceSchemaCopyWith<$Res> {
  __$$_ServiceSchemaCopyWithImpl(
      _$_ServiceSchema _value, $Res Function(_$_ServiceSchema) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweets = null,
    Object? users = null,
  }) {
    return _then(_$_ServiceSchema(
      tweets: null == tweets
          ? _value._tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as List<EndpointSchema>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EndpointSchema>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceSchema extends _ServiceSchema {
  const _$_ServiceSchema(
      {required final List<EndpointSchema> tweets,
      required final List<EndpointSchema> users})
      : _tweets = tweets,
        _users = users,
        super._();

  factory _$_ServiceSchema.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceSchemaFromJson(json);

  final List<EndpointSchema> _tweets;
  @override
  List<EndpointSchema> get tweets {
    if (_tweets is EqualUnmodifiableListView) return _tweets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tweets);
  }

  final List<EndpointSchema> _users;
  @override
  List<EndpointSchema> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'ServiceSchema(tweets: $tweets, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceSchema &&
            const DeepCollectionEquality().equals(other._tweets, _tweets) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tweets),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceSchemaCopyWith<_$_ServiceSchema> get copyWith =>
      __$$_ServiceSchemaCopyWithImpl<_$_ServiceSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceSchemaToJson(
      this,
    );
  }
}

abstract class _ServiceSchema extends ServiceSchema {
  const factory _ServiceSchema(
      {required final List<EndpointSchema> tweets,
      required final List<EndpointSchema> users}) = _$_ServiceSchema;
  const _ServiceSchema._() : super._();

  factory _ServiceSchema.fromJson(Map<String, dynamic> json) =
      _$_ServiceSchema.fromJson;

  @override
  List<EndpointSchema> get tweets;
  @override
  List<EndpointSchema> get users;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceSchemaCopyWith<_$_ServiceSchema> get copyWith =>
      throw _privateConstructorUsedError;
}
