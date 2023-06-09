// ignore_for_file: constant_identifier_names
import 'package:fgpt_ai/presentation/screens/home/home_screen.dart';
import 'package:fgpt_ai/presentation/screens/landing/landing_screen.dart';
import 'package:fgpt_ai/presentation/screens/settings/settings_screen.dart';
import 'package:fgpt_ai/presentation/screens/setup/setup_screen.dart';
import 'package:fgpt_ai/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

part 'app_navigator.dart';

class AppRouter {
  static const SPLASH_SCREEN = "/";
  static const LANDING_SCREEN = "landing/";
  static const HOME_SCREEN = "home/";
  static const SETTINGS_SCREEN = "settings/";
  static const SETUP_SCREEN = "setup/";

  static Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case LANDING_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
      case HOME_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case SETTINGS_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case SETUP_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const SetupScreen(),
        );

      default:
        return null;
    }
  }
}
