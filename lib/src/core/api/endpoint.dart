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

enum Endpoint {
  /// `/tweets/search/recent`
  tweetsSearchRecent(
    _tweetsService,
    HttpMethod.get,
    '/v2/tweets/search/recent',
  ),

  /// `/tweets/counts/recent`
  tweetsCountsRecent(
    _tweetsService,
    HttpMethod.get,
    '/v2/tweets/counts/recent',
  ),

  /// `/v2/users/me`
  usersMe(
    _usersService,
    HttpMethod.get,
    '/v2/users/me',
  );

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
