// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;
  final bool isBeforeLaunchedApp;

  const ThemeState({
    this.isDarkMode = false,
    this.isBeforeLaunchedApp = true,
  });

  @override
  List<Object> get props => [isDarkMode, isBeforeLaunchedApp];

  ThemeState copyWith({
    bool? isDarkMode,
    bool? isBeforeLaunchedApp,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isBeforeLaunchedApp: isBeforeLaunchedApp ?? this.isBeforeLaunchedApp,
    );
  }
}
