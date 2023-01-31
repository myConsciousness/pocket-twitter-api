// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:twitter_api_v2/twitter_api_v2.dart';

abstract class ParameterHelper {
  const ParameterHelper(final Map<String, String> parameters)
      : _parameters = parameters;

  /// The request parameters for this request.
  final Map<String, String> _parameters;

  String requiredStringValueOf(final String fieldName) =>
      stringValueOf(fieldName)!;

  List<String> requiredStringValuesOf(final String fieldName) =>
      _parameters[fieldName]!.split(',');

  String? stringValueOf(final String fieldName) =>
      _parameters[fieldName]!.isNotEmpty ? _parameters[fieldName] : null;

  int? intValueOf(final String fieldName) => _parameters[fieldName]!.isNotEmpty
      ? int.parse(_parameters[fieldName]!)
      : null;

  T? enumValueOf<T extends Serializable>(
    final T Function(String value) valueOf,
    final String fieldName,
  ) =>
      _parameters[fieldName]!.isNotEmpty
          ? valueOf(_parameters[fieldName]!)
          : null;

  List<TweetExpansion>? get tweetExpansions =>
      expansionsOf(TweetExpansion.valueOf);

  List<UserExpansion>? get userExpansions =>
      expansionsOf(UserExpansion.valueOf);

  List<T>? expansionsOf<T extends Serializable>(
    final T Function(String value) valueOf,
  ) =>
      serializedValuesOf(valueOf, 'expansions');

  List<TweetField>? get tweetFields =>
      serializedValuesOf(TweetField.valueOf, 'tweet.fields');

  List<UserField>? get userFields =>
      serializedValuesOf(UserField.valueOf, 'user.fields');

  List<PlaceField>? get placeFields =>
      serializedValuesOf(PlaceField.valueOf, 'place.fields');

  List<PollField>? get pollFields =>
      serializedValuesOf(PollField.valueOf, 'poll.fields');

  List<MediaField>? get mediaFields =>
      serializedValuesOf(MediaField.valueOf, 'media.fields');

  List<T>? serializedValuesOf<T extends Serializable>(
    final T Function(String value) valueOf,
    final String fieldName,
  ) =>
      _parameters[fieldName]!.isNotEmpty
          ? _parameters[fieldName]!
              .split(',')
              .map<T>((e) => valueOf(e))
              .toList()
          : null;

  DateTime? datetimeOf(final String fieldName) =>
      _parameters[fieldName]!.isNotEmpty
          ? DateTime.parse(_parameters[fieldName]!)
          : null;
}
