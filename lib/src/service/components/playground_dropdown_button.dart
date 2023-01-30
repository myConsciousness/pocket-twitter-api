// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../core/api/endpoint.dart';

class PlaygroundDropdownButton extends StatelessWidget {
  /// Returns the new instance of [PlaygroundDropdownButton].
  const PlaygroundDropdownButton({
    Key? key,
    required this.endpoint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final Endpoint endpoint;
  final List<DropdownMenuItem<Endpoint>> items;
  final Function(Endpoint?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButton(
          value: endpoint,
          items: items,
          onChanged: onChanged,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          underline: Container(),
          icon: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_circle_down),
          ),
          iconEnabledColor: Colors.blue,
        ),
      ),
    );
  }
}
