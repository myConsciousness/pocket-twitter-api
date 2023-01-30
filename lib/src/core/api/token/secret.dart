// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'model/tokens.dart';

const _clientId = String.fromEnvironment('PLAYGROUND_CLIENT_ID');
const _clientSecret = String.fromEnvironment('PLAYGROUND_CLIENT_SECRET');
const _oauthRedirectUri = String.fromEnvironment('PLAYGROUND_REDIRECT_URI');
const _oauthRedirectUriScheme =
    String.fromEnvironment('PLAYGROUND_REDIRECT_URI_SCHEME');

final secretStateProvider =
    StateNotifierProvider<_SecretStateNotifier, Tokens>((ref) {
  return _SecretStateNotifier();
});

class _SecretStateNotifier extends StateNotifier<Tokens> {
  _SecretStateNotifier()
      : super(
          const Tokens(
            clientId: _clientId,
            clientSecret: _clientSecret,
            redirectUri: _oauthRedirectUri,
            customUriScheme: _oauthRedirectUriScheme,
          ),
        );
}
