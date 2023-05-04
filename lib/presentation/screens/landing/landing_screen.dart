import 'package:fgpt_ai/config/constants/constants.dart';
import 'package:fgpt_ai/config/themes/palette.dart';
import 'package:fgpt_ai/presentation/router/router.dart';
import 'package:fgpt_ai/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final welcomeTexts = [
    "Convert your thoughts to Questions and get answered.",
    "Speech Recognition",
    "Powered by chat GPT AI",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              clipper: const CustomLandingCurveClipper(),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Palette.primary,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: AppPadding.landingScreenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi There,\nWelcome to Flutter GPT",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: AppFontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 30.h),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(
                        welcomeTexts[index],
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: AppFontWeight.medium,
                            ),
                      ),
                      separatorBuilder: (context, index) => WhiteSpace.gapH10,
                      itemCount: welcomeTexts.length,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Row(
                children: [
                  Expanded(
                    child: AppButtonWidget(
                      ontap: () {
                        AppNavigator.pushReplacement(
                            context: context,
                            screenName: AppRouter.HOME_SCREEN);
                      },
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Palette.white,
                              fontWeight: AppFontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CustomLandingCurveClipper extends CustomClipper<Path> {
  const CustomLandingCurveClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.5,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
