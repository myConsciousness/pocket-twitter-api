// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// � Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import '../../../core/api/endpoint.dart';
import '../../../core/schema/model/service_schema.dart';
import '../../components/playground_dropdown_button.dart';
import '../../components/playground_scaffold.dart';
import 'home_drawer.dart';
import 'home_floating_action_button.dart';
import 'home_input_fields.dart';

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
