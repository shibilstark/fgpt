import 'package:fgpt_ai/config/themes/custom_themes.dart';
import 'package:fgpt_ai/core/injections/injection_setup.dart';
import 'package:fgpt_ai/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/router/router.dart';

void main() async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 900),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: (context, child) {
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  theme:
                      state.isDarkMode ? CustomThemes.dark : CustomThemes.light,
                  debugShowCheckedModeBanner: false,
                  initialRoute: AppRouter.SPLASH_SCREEN,
                  onGenerateRoute: AppRouter.onGeneratedRoute,
                );
              },
            );
          }),
    );
  }
}