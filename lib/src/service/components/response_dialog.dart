// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

Future<void> showResponseDialog(
  final BuildContext context,
  final String response,
) async {
  await showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return ClassicGeneralDialogWidget(
        titleText: 'Response Data',
        contentText: response,
        onPositiveClick: () {
          Navigator.of(context).pop();
        },
        onNegativeClick: () {
          Navigator.of(context).pop();
        },
      );
    },
    animationType: DialogTransitionType.fadeScale,
    curve: Curves.easeIn,
    duration: const Duration(milliseconds: 500),
  );
}
