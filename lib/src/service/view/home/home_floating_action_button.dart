// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart' as oauth2;

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/api/token/refresh_token.dart';
import '../../../core/api/token/secret.dart';
import '../../../core/schema/model/service_schema.dart';
import '../../api/request_sender.dart';
import '../../components/playground_scaffold.dart';
import '../../validator/invalid_parameter_exception.dart';
import '../../validator/schema_validator.dart';
import '../result/result_navigation_type.dart';
import '../result/result_page.dart';

class PlaygroundHomeFloatingActionButton extends ConsumerWidget {
  const PlaygroundHomeFloatingActionButton({
    super.key,
    required ServiceSchema schema,
    required Map<String, TextEditingController> controllers,
  })  : _schema = schema,
        _controllers = controllers;

  final ServiceSchema _schema;
  final Map<String, TextEditingController> _controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) => FloatingActionButton(
        onPressed: () {
          final parameters = _parameters;

          try {
            SchemaValidator(
              _schema.endpointOf(ref.watch(endpointStateProvider)).parameters,
              parameters,
            ).execute();
          } on InvalidParameterException catch (e) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: e.title,
              desc: e.message,
              btnOkOnPress: () {
                // Do Nothing.
              },
            ).show();

            return;
          }

          _fetchAccessToken(context, ref).then(
            (accessToken) => showDialog(
              context: context,
              builder: (context) => FutureProgressDialog(
                RequestSender(
                  accessToken,
                  ref.watch(endpointStateProvider),
                  parameters,
                ).execute(onRetry: (event) {
                  // Do Nothing.
                }).then(
                  (response) async {
                    ref.read(navigationCurrentIndexProvider.notifier).update(
                          ResultNavigationType.body.value,
                        );

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          response: response,
                        ),
                      ),
                    );
                  },
                ).catchError((_) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Unknown Error',
                    desc: 'Please retry after a while.',
                    btnOkOnPress: () {
                      // Do Nothing.
                    },
                  ).show();
                }),
              ),
            ),
          );
        },
        tooltip: 'Send Request',
        child: const Icon(Icons.send),
      );

  Map<String, String> get _parameters => _controllers.map(
        (key, value) => MapEntry(key, value.text),
      );

  Future<String> _fetchAccessToken(
    final BuildContext context,
    final WidgetRef ref,
  ) async {
    final scopes = _schema.endpointOf(ref.watch(endpointStateProvider)).scopes;

    if (scopes.isEmpty) {
      //! When endpoint needs App-Only token.
      final controller = TextEditingController();
      final dialog = AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Enter App-Only Bearer Token',
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(controller: controller),
            ],
          ),
        ),
        btnOkOnPress: () async {
          if (controller.text.isEmpty) {
            await AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Empty',
              desc: 'Empty',
              btnOkOnPress: () {
                // Do Nothing.
              },
            ).show();

            return;
          }

          Navigator.pop(context);
        },
        onDismissCallback: (type) {
          // Do Nothing.
        },
        autoDismiss: false,
      );

      await dialog.show();

      return controller.text;
    }

    final tokens = ref.watch(secretStateProvider);

    if (ref.watch(refreshTokenStateProvider).isEmpty) {
      final oauthClient = oauth2.TwitterOAuth2Client(
        clientId: tokens.clientId,
        clientSecret: tokens.clientSecret,
        redirectUri: tokens.redirectUri,
        customUriScheme: tokens.customUriScheme,
      );

      final response = await oauthClient.executeAuthCodeFlowWithPKCE(
        scopes: [
          oauth2.Scope.offlineAccess,
          ...scopes,
        ],
      );

      ref
          .read(refreshTokenStateProvider.notifier)
          .update(response.refreshToken!);

      return response.accessToken;
    }

    final refreshedResponse = await OAuthUtils.refreshAccessToken(
      clientId: tokens.clientId,
      clientSecret: tokens.clientSecret,
      refreshToken: ref.watch(refreshTokenStateProvider),
    );

    ref
        .read(refreshTokenStateProvider.notifier)
        .update(refreshedResponse.refreshToken);

    return refreshedResponse.accessToken;
  }
}
