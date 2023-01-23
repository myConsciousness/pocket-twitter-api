// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum Service {
  /// Tweets Service.
  tweets;
}

const _tweetsService = Service.tweets;

enum Endpoint {
  /// `/tweets/search/recent`
  tweetsSearchRecent(_tweetsService);

  /// The service of this endpoint.
  final Service service;

  const Endpoint(this.service);

  /// Returns all endpoints in the [service].
  static List<Endpoint> endpointsOf(final Service service) =>
      values.where((endpoint) => endpoint.service == service).toList();
}
