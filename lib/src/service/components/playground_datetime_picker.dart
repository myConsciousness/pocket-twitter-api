// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PlaygroundDatetimePicker extends ConsumerWidget {
  const PlaygroundDatetimePicker({
    super.key,
    required this.controller,
    required this.labelText,
  });

  /// Required text that describes the input field.
  final String labelText;

  /// Controls the text being edited.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
        ),
        readOnly: true,
        onTap: () async {
          await DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            onConfirm: (datetime) {
              controller.clear();
              controller.text = datetime.toIso8601String();
            },
            currentTime: DateTime.now(),
          );
        },
      ),
    );
  }
}
