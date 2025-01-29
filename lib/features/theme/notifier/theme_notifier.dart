import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/data/repositories/user/local_preferences_repository.dart';

class ThemeNotifier extends ChangeNotifier {

  ThemeNotifier(
      {required this.preferencesRepository,})
      : _currentTheme = ThemeMode.system == ThemeMode.light
            ? FlexThemeData.light(
                scheme: FlexScheme.vesuviusBurn,
                surfaceTint: Colors.transparent,)
            : FlexThemeData.dark(
                scheme: FlexScheme.vesuviusBurn,
                surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                blendLevel: 20,
                tones: const FlexTones.light(),
                subThemesData: const FlexSubThemesData(
                  defaultRadius: 8,
                ),);
  final LocalPreferencesRepository preferencesRepository;
  final ThemeData lightTheme = FlexThemeData.light(
      tones: const FlexTones.dark(),
      scheme: FlexScheme.vesuviusBurn,
      surfaceTint: Colors.transparent,);

  final ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.vesuviusBurn,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    tones: const FlexTones.light(),
    subThemesData: const FlexSubThemesData(
      defaultRadius: 8,
    ),
  );

  ThemeData _currentTheme;

  bool _isLightTheme() => _currentTheme == lightTheme;
  bool isLightTheme() => _isLightTheme();

  ThemeData get currentTheme => _currentTheme;
  void toggleTheme(String userId) {
    _currentTheme = _isLightTheme() ? darkTheme : lightTheme;
    preferencesRepository.updateUserPreferences(
        userId: userId, isDarkMode: !_isLightTheme(),);
    notifyListeners();
  }

  void setUserTheme(bool userHasDarkTheme) {
    if ((userHasDarkTheme && _isLightTheme()) ||
        (!userHasDarkTheme && !_isLightTheme())) {
      _currentTheme = _isLightTheme() ? darkTheme : lightTheme;
      notifyListeners();
    }
  }
}
