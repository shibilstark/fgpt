import 'package:fgpt_ai/config/build_config/build_config.dart';
import 'package:fgpt_ai/config/themes/custom_themes.dart';
import 'package:fgpt_ai/core/injections/injection_setup.dart';
import 'package:fgpt_ai/domain/app_db/app_db_repository.dart';
import 'package:fgpt_ai/presentation/bloc/gpt_model/gpt_model_bloc.dart';
import 'package:fgpt_ai/presentation/bloc/theme/theme_bloc.dart';
import 'package:fgpt_ai/presentation/bloc/user/user_bloc.dart';
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

  BuildConfig.instantiate(
    environment: EvnType.dev,
    config: EnvironmentConfig(
      appName: "FGPT",
      baseUrl: "",
      requestTimeOut: const Duration(seconds: 20),
    ),
  );

  await configureInjection();
  await getIt<AppDbRepository>().initializeDB();
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
        BlocProvider(
          create: (context) => getIt<GptModelBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserBloc>(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 900),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: (context, child) {
            context.read<ThemeBloc>().add(const LoadTheme());

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
