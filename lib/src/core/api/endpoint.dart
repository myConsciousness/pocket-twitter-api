// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

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
  _EndpointStateNotifier() : super(Endpoint.tweetsSearchRecent);

  void update(final Endpoint endpoint) => state = endpoint;
}

const _tweetsService = Service.tweets;
const _usersService = Service.users;

const _httpGet = HttpMethod.get;
const _httpPost = HttpMethod.post;
const _httpDelete = HttpMethod.delete;

enum Endpoint {
  /// `/tweets/search/recent`
  tweetsSearchRecent(
    _tweetsService,
    _httpGet,
    '/v2/tweets/search/recent',
  ),

  /// `/tweets/counts/recent`
  tweetsCountsRecent(
    _tweetsService,
    _httpGet,
    '/v2/tweets/counts/recent',
  ),

  /// `/2/tweets`
  tweets(
    _tweetsService,
    _httpPost,
    '/2/tweets',
  ),

  /// `/2/users`
  users(
    _usersService,
    _httpGet,
    '/2/users',
  ),

  /// `/2/users/:id`
  usersId(
    _usersService,
    _httpGet,
    '/2/users/:id',
  ),

  /// `/2/users/by`
  usersBy(
    _usersService,
    _httpGet,
    '/2/users/by',
  ),

  /// `/2/users/by/username/:username`
  usersByUsername(
    _usersService,
    _httpGet,
    '/2/users/by/username/:username',
  ),

  /// `/v2/users/me`
  usersMe(
    _usersService,
    _httpGet,
    '/v2/users/me',
  ),

  /// `/users/:source_user_id/blocking/:target_user_id`
  usersSourceUserIdBlockingTargetUserId(
    _usersService,
    _httpDelete,
    '/users/:source_user_id/blocking/:target_user_id',
  ),

  /// `/2/users/:id/blocking`
  getUsersIdBlocking(
    _usersService,
    _httpGet,
    '/2/users/:id/blocking',
  ),

  /// `/2/users/:id/blocking`
  postUsersIdBlocking(
    _usersService,
    _httpPost,
    '/2/users/:id/blocking',
  ),

  /// `/2/users/:source_user_id/following/:target_user_id`
  usersSourceUserIdFollowingTargetUserId(
    _usersService,
    _httpDelete,
    '/2/users/:source_user_id/following/:target_user_id',
  ),

  /// `/2/users/:id/following`
  postUsersIdFollowing(
    _usersService,
    _httpPost,
    '/2/users/:id/following',
  ),

  /// `/2/users/:id/followers`
  usersIdFollowers(
    _usersService,
    _httpGet,
    '/2/users/:id/followers',
  ),

  /// `/2/users/:id/following`
  getUsersIdFollowing(
    _usersService,
    _httpGet,
    '/2/users/:id/following',
  ),

  /// `/2/users/:source_user_id/muting/:target_user_id`
  usersSourceUserIdMutingTargetUserId(
    _usersService,
    _httpDelete,
    '/2/users/:source_user_id/muting/:target_user_id',
  ),

  /// `/2/users/:id/muting`
  postUsersIdMuting(
    _usersService,
    _httpPost,
    '/2/users/:id/muting',
  ),

  /// `/2/users/:id/muting`
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
