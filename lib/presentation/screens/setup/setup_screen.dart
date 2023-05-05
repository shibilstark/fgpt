import 'package:fgpt_ai/config/constants/constants.dart';
import 'package:fgpt_ai/core/injections/injection_setup.dart';
import 'package:fgpt_ai/domain/gpt/reposiotory/gpt_repository.dart';
import 'package:fgpt_ai/presentation/router/router.dart';
import 'package:fgpt_ai/presentation/screens/settings/settings_screen.dart';
import 'package:fgpt_ai/presentation/widgets/app_button.dart';
import 'package:fgpt_ai/presentation/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/themes/themes.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.landingScreenPadding,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select an answer processing model",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: AppFontWeight.medium,
                          ),
                    ),
                    SizedBox(height: 40.h),
                    const GptModelViewWidget(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppButtonWidget(
                    ontap: () {
                      final currentModel =
                          getIt<GptRepository>().getModelFromDb();

                      if (currentModel != null) {
                        AppNavigator.pushReplacement(
                            context: context,
                            screenName: AppRouter.HOME_SCREEN);
                      } else {
                        showCustomSnackBar(context,
                            message: "Please select a model to continue");
                      }
                    },
                    child: Text(
                      "Select",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Palette.white,
                            fontWeight: AppFontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
