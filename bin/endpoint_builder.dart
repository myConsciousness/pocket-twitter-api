// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:convert';
import 'dart:io';

void main() {
  final Map<String, dynamic> schema = jsonDecode(
    File('./assets/schema/schema.json').readAsStringSync(),
  );

  final buffer = StringBuffer();

  schema.forEach((key, value) {
    for (final Map<String, dynamic> endpoints in value) {
      final endpointElements = endpoints['endpoint'].split('#');

      buffer.writeln('''
  /// `${endpointElements[0]} ${endpointElements[1]}`
  ${_getElementName(endpointElements[0], endpointElements[1])}(
    ${_getService(key)},
    ${_getHttpMethod(endpointElements[0])},
    '${endpointElements[1]}',
  ),''');
      buffer.writeln();
    }
  });

  //! Remove unnecessary return codes.
  final elements = buffer.toString().split('\n');
  elements
    ..removeLast()
    ..removeLast();

  File('./lib/src/core/api/endpoint.dart')
      .writeAsStringSync('''// Copyright 2023 Kato Shinya. All rights reserved.
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
${elements.join('\n')}
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
      if (resource == '\${endpoint.httpMethod.value} \${endpoint.unencodedUrl}') {
        return endpoint;
      }
    }

    throw UnsupportedError('Unsupported value [\$resource].');
  }

  /// Returns all endpoints in the [service].
  static List<Endpoint> of(final Service service) =>
      values.where((endpoint) => endpoint.service == service).toList();
}
''');
}

String _getElementName(
  final String httpMethod,
  final String resourcePath,
) {
  final buffer = StringBuffer()
    ..write(httpMethod.toLowerCase())
    ..write(
      resourcePath
          .replaceAll(':', '')
          .split('/')
          //! Remove empty and API version like `/2/`.
          .where((e) => e.isNotEmpty && int.tryParse(e) == null)
          .map((e) => e.contains('_')
              ? e
                  .split('_')
                  .map((e) => e.substring(0, 1).toUpperCase() + e.substring(1))
                  .join()
              : e.substring(0, 1).toUpperCase() + e.substring(1))
          .toList()
          .join(),
    );

  return buffer.toString();
}

String _getService(final String service) {
  switch (service) {
    case 'tweets':
      return '_tweetsService';
    case 'users':
      return '_usersService';
    default:
      throw UnsupportedError('Unsupported value [$service].');
  }
}

String _getHttpMethod(final String httpMethod) {
  switch (httpMethod) {
    case 'GET':
      return '_httpGet';
    case 'POST':
      return '_httpPost';
    case 'DELETE':
      return '_httpDelete';
    default:
      throw UnsupportedError('Unsupported value [$httpMethod].');
  }
}
