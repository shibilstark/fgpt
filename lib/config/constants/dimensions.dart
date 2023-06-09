import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFontSize {
  static final titleLarge = 24.sp;
  static final titleMedium = 22.sp;
  static final titleSmall = 20.sp;
  static final bodyLarge = 18.sp;
  static final bodyMedium = 16.sp;
  static final bodySmall = 14.sp;
  static final displayLarge = 12.sp;
  static final displayMedium = 10.sp;
  static final displaySmall = 8.sp;
}

class AppFontWeight {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
}

class AppPadding {
  static const commonScreenPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 5);
  static const landingScreenPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 40);
}

class WhiteSpace {
  static final gapH5 = SizedBox(height: 5.h);
  static final gapH10 = SizedBox(height: 10.h);
  static final gapH15 = SizedBox(height: 15.h);
  static final gapH20 = SizedBox(height: 20.h);
  static final gapH25 = SizedBox(height: 25.h);
  static final gapW5 = SizedBox(width: 5.w);
  static final gapW10 = SizedBox(width: 10.w);
  static final gapW15 = SizedBox(width: 15.w);
  static final gapW20 = SizedBox(width: 20.w);
  static final gapW25 = SizedBox(width: 25.w);
}
