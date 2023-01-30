// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class PlaygroundPicklist extends ConsumerWidget {
  const PlaygroundPicklist({
    super.key,
    required this.title,
    required this.controller,
    required this.labelText,
    required this.items,
  });

  final String title;

  /// Required text that describes the input field.
  final String labelText;

  /// Controls the text being edited.
  final TextEditingController controller;

  final List<MultiSelectItem<dynamic>> items;

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
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller.clear();
            },
          ),
        ),
        readOnly: true,
        onTap: () async {
          await showModalBottomSheet(
            isScrollControlled: true, // required for min/max child size
            context: context,
            builder: (_) {
              return MultiSelectBottomSheet(
                searchable: true,
                title: Text(
                  'Select $title 👇',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                listType: MultiSelectListType.CHIP,
                selectedColor: Colors.lightBlue,
                unselectedColor: Colors.black12,
                items: items,
                initialValue: controller.text.split(','),
                onConfirm: (values) {
                  controller.clear;
                  controller.text =
                      values.where((element) => element.isNotEmpty).join(',');
                },
                maxChildSize: 0.8,
              );
            },
          );
        },
      ),
    );
  }
}
