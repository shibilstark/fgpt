import 'dart:developer';

import 'package:fgpt_ai/presentation/bloc/gpt_model/gpt_model_bloc.dart';
import 'package:fgpt_ai/presentation/bloc/theme/theme_bloc.dart';
import 'package:fgpt_ai/presentation/bloc/user/user_bloc.dart';
import 'package:fgpt_ai/presentation/router/router.dart';
import 'package:fgpt_ai/utils/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(const LoadUserData());
    context.read<GptModelBloc>().add(GetAllGptModels(context: context));
    _activateRoute();
    super.initState();
  }

  void _activateRoute() async {
    final isLaunchedBefore = await PreferenceUtils.getLuanchStatus();

    if (isLaunchedBefore) {
      await Future.delayed(const Duration(seconds: 2), () {
        AppNavigator.pushReplacement(
            context: context, screenName: AppRouter.HOME_SCREEN);
      });
    } else {
      await Future.delayed(const Duration(seconds: 2), () {
        AppNavigator.pushReplacement(
            context: context, screenName: AppRouter.LANDING_SCREEN);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
