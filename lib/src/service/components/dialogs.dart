// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

const _animationType = AnimType.rightSlide;

AwesomeDialog getErrorDialog(
  final BuildContext context, {
  required String title,
  String? description,
}) =>
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: _animationType,
      title: title,
      desc: description,
      btnOkOnPress: () {
        // Do Nothing.
      },
    );
