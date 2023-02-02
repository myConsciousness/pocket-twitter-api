// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// GENERATED CODE - DO NOT MODIFY BY HAND

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

// 🌎 Project imports:
import 'service.dart';

final endpointStateProvider =
    StateNotifierProvider<_EndpointStateNotifier, Endpoint>((ref) {
  return _EndpointStateNotifier();
});

class _EndpointStateNotifier extends StateNotifier<Endpoint> {
  _EndpointStateNotifier() : super(Endpoint.getTweetsSearchRecent);

  void update(final Endpoint endpoint) => state = endpoint;
}

const _tweetsService = Service.tweets;
const _usersService = Service.users;

const _httpGet = HttpMethod.get;
const _httpPost = HttpMethod.post;
const _httpDelete = HttpMethod.delete;

enum Endpoint {
  /// `GET /2/tweets/search/recent`
  getTweetsSearchRecent(
    _tweetsService,
    _httpGet,
    '/2/tweets/search/recent',
  ),

  /// `GET /2/tweets/counts/recent`
  getTweetsCountsRecent(
    _tweetsService,
    _httpGet,
    '/2/tweets/counts/recent',
  ),

  /// `DELETE /2/tweets/:id`
  deleteTweetsId(
    _tweetsService,
    _httpDelete,
    '/2/tweets/:id',
  ),

  /// `POST /2/tweets`
  postTweets(
    _tweetsService,
    _httpPost,
    '/2/tweets',
  ),

  /// `DELETE /2/users/:id/likes/:tweet_id`
  deleteUsersIdLikesTweetId(
    _tweetsService,
    _httpDelete,
    '/2/users/:id/likes/:tweet_id',
  ),

  /// `POST /2/users/:id/likes`
  postUsersIdLikes(
    _tweetsService,
    _httpPost,
    '/2/users/:id/likes',
  ),

  /// `GET /2/tweets/:id/liking_users`
  getTweetsIdLikingUsers(
    _tweetsService,
    _httpGet,
    '/2/tweets/:id/liking_users',
  ),

  /// `GET /2/users/:id/liked_tweets`
  getUsersIdLikedTweets(
    _tweetsService,
    _httpGet,
    '/2/users/:id/liked_tweets',
  ),

  /// `DELETE /2/users/:id/retweets/:source_tweet_id`
  deleteUsersIdRetweetsSourceTweetId(
    _tweetsService,
    _httpDelete,
    '/2/users/:id/retweets/:source_tweet_id',
  ),

  /// `POST /2/users/:id/retweets`
  postUsersIdRetweets(
    _tweetsService,
    _httpPost,
    '/2/users/:id/retweets',
  ),

  /// `GET /2/tweets/:id/retweeted_by`
  getTweetsIdRetweetedBy(
    _tweetsService,
    _httpGet,
    '/2/tweets/:id/retweeted_by',
  ),

  /// `GET /2/tweets/:id/quote_tweets`
  getTweetsIdQuoteTweets(
    _tweetsService,
    _httpGet,
    '/2/tweets/:id/quote_tweets',
  ),

  /// `GET /2/users`
  getUsers(
    _usersService,
    _httpGet,
    '/2/users',
  ),

  /// `GET /2/users/:id`
  getUsersId(
    _usersService,
    _httpGet,
    '/2/users/:id',
  ),

  /// `GET /2/users/by`
  getUsersBy(
    _usersService,
    _httpGet,
    '/2/users/by',
  ),

  /// `GET /2/users/by/username/:username`
  getUsersByUsernameUsername(
    _usersService,
    _httpGet,
    '/2/users/by/username/:username',
  ),

  /// `GET /2/users/me`
  getUsersMe(
    _usersService,
    _httpGet,
    '/2/users/me',
  ),

  /// `DELETE /users/:source_user_id/blocking/:target_user_id`
  deleteUsersSourceUserIdBlockingTargetUserId(
    _usersService,
    _httpDelete,
    '/users/:source_user_id/blocking/:target_user_id',
  ),

  /// `GET /2/users/:id/blocking`
  getUsersIdBlocking(
    _usersService,
    _httpGet,
    '/2/users/:id/blocking',
  ),

  /// `POST /2/users/:id/blocking`
  postUsersIdBlocking(
    _usersService,
    _httpPost,
    '/2/users/:id/blocking',
  ),

  /// `DELETE /2/users/:source_user_id/following/:target_user_id`
  deleteUsersSourceUserIdFollowingTargetUserId(
    _usersService,
    _httpDelete,
    '/2/users/:source_user_id/following/:target_user_id',
  ),

  /// `POST /2/users/:id/following`
  postUsersIdFollowing(
    _usersService,
    _httpPost,
    '/2/users/:id/following',
  ),

  /// `GET /2/users/:id/followers`
  getUsersIdFollowers(
    _usersService,
    _httpGet,
    '/2/users/:id/followers',
  ),

  /// `GET /2/users/:id/following`
  getUsersIdFollowing(
    _usersService,
    _httpGet,
    '/2/users/:id/following',
  ),

  /// `DELETE /2/users/:source_user_id/muting/:target_user_id`
  deleteUsersSourceUserIdMutingTargetUserId(
    _usersService,
    _httpDelete,
    '/2/users/:source_user_id/muting/:target_user_id',
  ),

  /// `POST /2/users/:id/muting`
  postUsersIdMuting(
    _usersService,
    _httpPost,
    '/2/users/:id/muting',
  ),

  /// `GET /2/users/:id/muting`
  getUsersIdMuting(
    _usersService,
    _httpGet,
    '/2/users/:id/muting',
  ),
  ;

  /// The service of this endpoint.
  final Service service;

  /// The http method of this endpoint.
  final HttpMethod httpMethod;

  /// The unencoded url.
  final String unencodedUrl;

  const Endpoint(
    this.service,
    this.httpMethod,
    this.unencodedUrl,
  );

  static Endpoint resourceOf(final String resource) {
    for (final endpoint in values) {
      if (resource == '${endpoint.httpMethod.value} ${endpoint.unencodedUrl}') {
        return endpoint;
      }
    }

    throw UnsupportedError('Unsupported value [$resource].');
  }

  /// Returns all endpoints in the [service].
  static List<Endpoint> of(final Service service) =>
      values.where((endpoint) => endpoint.service == service).toList();
}
