// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:twitter_api_v2/twitter_api_v2.dart';

// 🌎 Project imports:
import '../../core/api/endpoint.dart';
import 'parameter_helper.dart';

class RequestSender extends ParameterHelper {
  /// Returns the new instance of [RequestSender].
  const RequestSender(
    this._accessToken,
    this._endpoint,
    super.parameters,
  );

  /// The access token for this request.
  final String _accessToken;

  /// The endpoint to communicate.
  final Endpoint _endpoint;

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
          query: requiredStringValueOf('query'),
          maxResults: intValueOf('max_results'),
          nextToken: stringValueOf('next_token'),
          sortOrder: enumValueOf(SortOrder.valueOf, 'sort_order'),
          startTime: datetimeOf('start_time'),
          endTime: datetimeOf('end_time'),
          sinceTweetId: stringValueOf('since_id'),
          untilTweetId: stringValueOf('until_id'),
          expansions: tweetExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
          placeFields: placeFields,
          pollFields: pollFields,
          mediaFields: mediaFields,
        );
      case Endpoint.tweetsCountsRecent:
        return await twitter.tweets.countRecent(
          query: requiredStringValueOf('query'),
          nextToken: stringValueOf('next_token'),
          startTime: datetimeOf('start_time'),
          endTime: datetimeOf('end_time'),
          sinceTweetId: stringValueOf('since_id'),
          untilTweetId: stringValueOf('until_id'),
          granularity: enumValueOf(
            TweetCountGranularity.valueOf,
            'granularity',
          ),
        );
      case Endpoint.users:
        return await twitter.users.lookupByIds(
          userIds: requiredStringValuesOf('ids'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.usersId:
        return await twitter.users.lookupById(
          userId: requiredStringValueOf('id'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.usersBy:
        return await twitter.users.lookupByNames(
          usernames: requiredStringValuesOf('usernames'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.usersByUsername:
        return await twitter.users.lookupByName(
          username: requiredStringValueOf('username'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.usersMe:
        return await twitter.users.lookupMe(
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
    }
  }
}
