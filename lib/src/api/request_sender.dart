// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:twitter_api_playground/src/api/endpoint.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class RequestSender {
  /// Returns the new instance of [RequestSender].
  const RequestSender(
    this._endpoint,
    this._parameters,
  );

  /// The endpoint to communicate.
  final Endpoint _endpoint;

  final Map<String, String> _parameters;

  Future<TwitterResponse> execute() async {
    final twitter = TwitterApi(
      bearerToken: '',
      retryConfig: RetryConfig(
        maxAttempts: 5,
        onExecute: print,
      ),
    );

    switch (_endpoint) {
      case Endpoint.tweetsSearchRecent:
        return twitter.tweets.searchRecent(
          query: _parameters['query'] ?? '',
        );
    }
  }
}
