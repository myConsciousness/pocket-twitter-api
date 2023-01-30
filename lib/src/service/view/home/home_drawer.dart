// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/api/service.dart';
import '../../../core/api/token/refresh_token.dart';
import '../../../core/theme/brightness.dart';

class PlaygroundHomeDrawer extends ConsumerWidget {
  const PlaygroundHomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: _buildDrawerItems(context, ref),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  tooltip: ref.watch(brightnessStateProvider) == Brightness.dark
                      ? 'Light Mode'
                      : 'Dark Mode',
                  icon: ref.watch(brightnessStateProvider) == Brightness.dark
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
                  onPressed: () {
                    final brightness = ref.watch(brightnessStateProvider);
                    final brightnessNotifier =
                        ref.read(brightnessStateProvider.notifier);

                    brightness == Brightness.dark
                        ? brightnessNotifier.toLightMode()
                        : brightnessNotifier.toDarkMode();
                  },
                ),
                IconButton(
                  tooltip: 'Contact @realshinyakato',
                  onPressed: () => launchUrl(
                    Uri.https(
                      'twitter.com',
                      '/realshinyakato',
                    ),
                  ),
                  icon: const Icon(FontAwesomeIcons.twitter),
                ),
                IconButton(
                  tooltip: 'Contact @myConsciousness',
                  onPressed: () => launchUrl(
                    Uri.https(
                      'github.com',
                      '/myConsciousness/twitter-api-playground',
                    ),
                  ),
                  icon: const Icon(FontAwesomeIcons.github),
                ),
                IconButton(
                  tooltip: 'Rate App',
                  onPressed: () async {
                    await LaunchReview.launch(
                      androidAppId: '',
                      iOSAppId: '',
                    );
                  },
                  icon: const Icon(Icons.reviews),
                ),
                IconButton(
                  tooltip: 'Licenses',
                  icon: const Icon(Icons.info),
                  onPressed: () {
                    showLicensePage(context: context);
                  },
                ),
              ],
            ),
          ),
        ],
      );

  List<Widget> _buildDrawerItems(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    final menuItems = <Widget>[];

    for (final service in Service.values) {
      menuItems.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              service.itemName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              ref.read(refreshTokenStateProvider.notifier).clear();
              ref.read(serviceStateProvider.notifier).update(service);
              ref
                  .read(endpointStateProvider.notifier)
                  .update(Endpoint.of(service).first);

              final snackBar = SnackBar(
                content: Text(
                  'Changed to ${service.itemName}.',
                  style: const TextStyle(fontSize: 17),
                ),
                showCloseIcon: true,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              //! Close drawer.
              Navigator.pop(context);
            },
          ),
        ),
      );
    }

    return menuItems;
  }
}
