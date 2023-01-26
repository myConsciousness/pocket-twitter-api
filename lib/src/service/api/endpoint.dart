// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'service.dart';

const _tweetsService = Service.tweets;
const _usersService = Service.users;

enum Endpoint {
  /// `/tweets/search/recent`
  tweetsSearchRecent(_tweetsService, '/v2/tweets/search/recent'),

  /// `/tweets/counts/recent`
  tweetsCountsRecent(_tweetsService, '/v2/tweets/counts/recent'),

  /// `/v2/users/me`
  usersMe(_usersService, '/v2/users/me');

  /// The service of this endpoint.
  final Service service;

  /// The unencoded url.
  final String unencodedUrl;

  const Endpoint(
    this.service,
    this.unencodedUrl,
  );

  /// Returns all endpoints in the [service].
  static List<Endpoint> of(final Service service) =>
      values.where((endpoint) => endpoint.service == service).toList();
}
