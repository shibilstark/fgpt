import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constants/constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<LoadTheme>(_loadTheme);
    on<ChangeTheme>(_changeTheme);
    on<ChangeLaunchMode>(_changeInitialLaunch);
  }

  void _loadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final isDarkMode = await _getBool(PreferenceConstants.isDarkMode);
    final isInitialLaunch =
        await _getBool(PreferenceConstants.isLaunchedBefore);

    emit(state.copyWith(
      isDarkMode: isDarkMode,
      isBeforeLaunchedApp: isInitialLaunch,
    ));
  }

  void _changeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    await _setBool(PreferenceConstants.isDarkMode, event.isDarkMode);

    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  void _changeInitialLaunch(
      ChangeLaunchMode event, Emitter<ThemeState> emit) async {
    await _setBool(PreferenceConstants.isLaunchedBefore, true);

    emit(state.copyWith(isBeforeLaunchedApp: true));
  }

  Future _setBool(String key, bool val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, val);
    return;
  }

  Future<bool> _getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
