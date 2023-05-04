import 'package:fgpt_ai/presentation/router/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _activateRoute();
    super.initState();
  }

  void _activateRoute() async {
    await Future.delayed(const Duration(seconds: 2), () {
      AppNavigator.pushReplacement(
          context: context, screenName: AppRouter.LANDING_SCREEN);
    });
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
