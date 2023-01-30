// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import '../../core/api/endpoint.dart';

class PlaygroundDropdownButton extends StatelessWidget {
  /// Returns the new instance of [PlaygroundDropdownButton].
  PlaygroundDropdownButton({
    Key? key,
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
  })  : _controller = TextEditingController(
            text: '${value.httpMethod.value} ${value.unencodedUrl}'),
        super(key: key);

  final String labelText;
  final Endpoint value;
  final List<SelectedListItem> items;
  final Function(Endpoint value) onChanged;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          filled: true,
        ),
        readOnly: true,
        onTap: () async {
          DropDownState(
            DropDown(
              bottomSheetTitle: const Text(
                'Select endpoint 👇',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              submitButtonChild: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              data: items,
              selectedItems: (List<dynamic> selectedList) {
                for (final item in selectedList) {
                  if (item is SelectedListItem) {
                    _controller.text = item.value!;
                    onChanged.call(Endpoint.resourceOf(item.value!));
                  }
                }
              },
            ),
          ).showModal(context);
        },
      ),
    );
  }
}
