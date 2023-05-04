import 'package:flutter/material.dart';

import '../../config/themes/themes.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.ontap,
    required this.child,
    this.borderRadius,
    this.backgroundColor = Palette.primary,
    this.textColor = Palette.white,
  });

  final void Function() ontap;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
        ),
      ),
      child: child,
    );
  }
}
