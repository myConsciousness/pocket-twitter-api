// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// � Package imports:
import 'package:drop_down_list/model/selected_list_item.dart';

// � Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/api/service.dart';
import '../../../core/api/token/refresh_token.dart';
import '../../../core/schema/model/service_schema.dart';
import '../../components/playground_dropdown_button.dart';
import '../../components/playground_scaffold.dart';
import 'home_drawer.dart';
import 'home_floating_action_button.dart';
import 'home_input_fields.dart';

// � Flutter imports:

class PlaygroundHomePage extends ConsumerWidget {
  PlaygroundHomePage({
    super.key,
    required ServiceSchema schema,
  }) : _schema = schema;

  final ServiceSchema _schema;
  final _controllers = <String, TextEditingController>{};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlaygroundScaffold(
      drawer: const PlaygroundHomeDrawer(),
      floatingActionButton: PlaygroundHomeFloatingActionButton(
        schema: _schema,
        controllers: _controllers,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: PlaygroundEndpointMenu(
              labelText: 'Endpoint',
              value: ref.watch(endpointStateProvider),
              onChanged: (endpoint) {
                ref.read(refreshTokenStateProvider.notifier).clear();
                ref.read(endpointStateProvider.notifier).update(endpoint);
              },
            ),
          ),
          const Divider(),
          PlaygroundInputFields(
            schema: _schema,
            controllers: _controllers,
          ),
        ],
      ),
    );
  }
}
