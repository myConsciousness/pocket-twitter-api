// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Tokens {
  String get clientId => throw _privateConstructorUsedError;
  String get clientSecret => throw _privateConstructorUsedError;
  String get redirectUri => throw _privateConstructorUsedError;
  String get customUriScheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokensCopyWith<Tokens> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensCopyWith<$Res> {
  factory $TokensCopyWith(Tokens value, $Res Function(Tokens) then) =
      _$TokensCopyWithImpl<$Res, Tokens>;
  @useResult
  $Res call(
      {String clientId,
      String clientSecret,
      String redirectUri,
      String customUriScheme});
}

/// @nodoc
class _$TokensCopyWithImpl<$Res, $Val extends Tokens>
    implements $TokensCopyWith<$Res> {
  _$TokensCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? clientSecret = null,
    Object? redirectUri = null,
    Object? customUriScheme = null,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
      customUriScheme: null == customUriScheme
          ? _value.customUriScheme
          : customUriScheme // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokensCopyWith<$Res> implements $TokensCopyWith<$Res> {
  factory _$$_TokensCopyWith(_$_Tokens value, $Res Function(_$_Tokens) then) =
      __$$_TokensCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId,
      String clientSecret,
      String redirectUri,
      String customUriScheme});
}

/// @nodoc
class __$$_TokensCopyWithImpl<$Res>
    extends _$TokensCopyWithImpl<$Res, _$_Tokens>
    implements _$$_TokensCopyWith<$Res> {
  __$$_TokensCopyWithImpl(_$_Tokens _value, $Res Function(_$_Tokens) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? clientSecret = null,
    Object? redirectUri = null,
    Object? customUriScheme = null,
  }) {
    return _then(_$_Tokens(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
      customUriScheme: null == customUriScheme
          ? _value.customUriScheme
          : customUriScheme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Tokens implements _Tokens {
  const _$_Tokens(
      {required this.clientId,
      required this.clientSecret,
      required this.redirectUri,
      required this.customUriScheme});

  @override
  final String clientId;
  @override
  final String clientSecret;
  @override
  final String redirectUri;
  @override
  final String customUriScheme;

  @override
  String toString() {
    return 'Tokens(clientId: $clientId, clientSecret: $clientSecret, redirectUri: $redirectUri, customUriScheme: $customUriScheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tokens &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.redirectUri, redirectUri) ||
                other.redirectUri == redirectUri) &&
            (identical(other.customUriScheme, customUriScheme) ||
                other.customUriScheme == customUriScheme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, clientId, clientSecret, redirectUri, customUriScheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokensCopyWith<_$_Tokens> get copyWith =>
      __$$_TokensCopyWithImpl<_$_Tokens>(this, _$identity);
}

abstract class _Tokens implements Tokens {
  const factory _Tokens(
      {required final String clientId,
      required final String clientSecret,
      required final String redirectUri,
      required final String customUriScheme}) = _$_Tokens;

  @override
  String get clientId;
  @override
  String get clientSecret;
  @override
  String get redirectUri;
  @override
  String get customUriScheme;
  @override
  @JsonKey(ignore: true)
  _$$_TokensCopyWith<_$_Tokens> get copyWith =>
      throw _privateConstructorUsedError;
}
