// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaygroundRadioList extends ConsumerWidget {
  const PlaygroundRadioList({
    super.key,
    required this.controller,
    required this.labelText,
    required this.items,
  });

  final TextEditingController controller;

  final String labelText;

  final List<String> items;

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
        ),
        readOnly: true,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text(
                  'Select $labelText 👇',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: items
                    .map(
                      (item) => SimpleDialogOption(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          controller.text = item;

                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              );
            },
          );
        },
      ),
    );
  }
}
