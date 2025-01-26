import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  final ThemeData lightTheme = FlexThemeData.light(
      tones: const FlexTones.dark(),
      scheme: FlexScheme.vesuviusBurn,
      surfaceTint: Colors.transparent);

  final ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.vesuviusBurn,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    darkIsTrueBlack: false,
    blendLevel: 20,
    tones: const FlexTones.light(),
    subThemesData: const FlexSubThemesData(
      defaultRadius: 8.0,
    ),
  );

  ThemeData _currentTheme;

  bool _isLightTheme() => _currentTheme == lightTheme;
  bool isLightTheme() => _isLightTheme();

  ThemeNotifier({ThemeMode themeMode = ThemeMode.system})
      : _currentTheme = ThemeMode.system == ThemeMode.light
            ? FlexThemeData.light(
                scheme: FlexScheme.vesuviusBurn,
                surfaceTint: Colors.transparent)
            : FlexThemeData.dark(
                scheme: FlexScheme.vesuviusBurn,
                surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                darkIsTrueBlack: false,
                blendLevel: 20,
                tones: const FlexTones.light(),
                subThemesData: const FlexSubThemesData(
                  defaultRadius: 8.0,
                ));

  ThemeData get currentTheme => _currentTheme;
  void toggleTheme() {
    _currentTheme = _isLightTheme() ? darkTheme : lightTheme;
    notifyListeners();
  }

  void setUserTheme(bool userHasDarkTheme) {
    if ((userHasDarkTheme && _isLightTheme()) ||
        (!userHasDarkTheme && !_isLightTheme())) {
      toggleTheme();
    }
  }
}
