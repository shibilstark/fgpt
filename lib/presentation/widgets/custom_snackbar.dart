import 'package:fgpt_ai/presentation/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../config/constants/constants.dart';
import '../../config/themes/themes.dart';

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  SnackBarType type = SnackBarType.success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          children: [
            RoundedContainerWidget(
              borderRadius: BorderRadius.circular(5),
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                color: Palette.primary,
              ),
            ),
            WhiteSpace.gapW15,
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Palette.white,
                  fontWeight: AppFontWeight.regular,
                  fontSize: AppFontSize.displayLarge,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ],
        ),
      )));
}
