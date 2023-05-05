part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class LoadTheme extends ThemeEvent {
  const LoadTheme();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final bool isDarkMode;
  const ChangeTheme(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}

class ChangeLaunchMode extends ThemeEvent {
  const ChangeLaunchMode();
}
