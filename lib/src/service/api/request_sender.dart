// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:twitter_api_v2/twitter_api_v2.dart';

// 🌎 Project imports:
import '../../core/api/endpoint.dart';

class RequestSender {
  /// Returns the new instance of [RequestSender].
  const RequestSender(
    this._accessToken,
    this._endpoint,
    this._parameters,
  );

  final String _accessToken;

  /// The endpoint to communicate.
  final Endpoint _endpoint;

  final Map<String, String> _parameters;

  Future<TwitterResponse> execute({
    required Function(RetryEvent event)? onRetry,
  }) async {
    final twitter = TwitterApi(
      bearerToken: _accessToken,
      retryConfig: RetryConfig(
        maxAttempts: 5,
        onExecute: onRetry,
      ),
    );

    switch (_endpoint) {
      case Endpoint.tweetsSearchRecent:
        return await twitter.tweets.searchRecent(
          query: _parameters['query'] ?? '',
        );
      case Endpoint.tweetsCountsRecent:
        return await twitter.tweets.countRecent(
          query: _parameters['query'] ?? '',
        );
      case Endpoint.usersMe:
        return await twitter.users.lookupMe();
    }
  }
}
