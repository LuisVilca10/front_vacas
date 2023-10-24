import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static  List<Color> colorOptions = [
    Colors.grey,
  ];
  static   List<String> colorText = <String>[
    "Green"
  ];

  static List<Color> colorOptionsLD = <Color>[Colors.blue, Colors.green];
  static List<String> colorTextLD = <String>["Green"];

  static List<ColorScheme> colorOptionsShemeL = [
    lightColorSchemeGrey,
  ];
  static List<ColorScheme> colorOptionsShemeD = [
    darkColorSchemeGrey,
  ];


  static  bool useMaterial3 = false;
  static bool useLightMode = true;
  static  int colorSelected = 1;

  static  ThemeData themeData=ThemeData(
      colorSchemeSeed: AppTheme.colorOptions[AppTheme.colorSelected],
      useMaterial3: AppTheme.useMaterial3,
      brightness: AppTheme.useLightMode ? Brightness.light : Brightness.dark);

  static const Color grey = Color(0xFF3A5160);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static Color colorMenu=Color(0xFF3A5160);

  static ThemeData themeDataLight=ThemeData(useMaterial3: useMaterial3,
      colorScheme: AppTheme.colorOptionsShemeL[AppTheme.colorSelected]);
  static ThemeData themeDataDark=ThemeData(useMaterial3: useMaterial3,
      colorScheme: AppTheme.colorOptionsShemeD[AppTheme.colorSelected]);

  static const lightColorSchemeGrey = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006A65),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF70F7EE),
    onPrimaryContainer: Color(0xFF00201E),
    secondary: Color(0xFF4A6361),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCCE8E5),
    onSecondaryContainer: Color(0xFF051F1E),
    tertiary: Color(0xFF48607B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD0E4FF),
    onTertiaryContainer: Color(0xFF001D34),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFAFDFB),
    onBackground: Color(0xFF191C1C),
    surface: Color(0xFFFAFDFB),
    onSurface: Color(0xFF191C1C),
    surfaceVariant: Color(0xFFDAE5E3),
    onSurfaceVariant: Color(0xFF3F4947),
    outline: Color(0xFF6F7978),
    onInverseSurface: Color(0xFFEFF1F0),
    inverseSurface: Color(0xFF2D3130),
    inversePrimary: Color(0xFF4FDAD2),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006A65),
    outlineVariant: Color(0xFFBEC9C7),
    scrim: Color(0xFF000000),
  );

  static const darkColorSchemeGrey = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF4FDAD2),
    onPrimary: Color(0xFF003734),
    primaryContainer: Color(0xFF00504C),
    onPrimaryContainer: Color(0xFF70F7EE),
    secondary: Color(0xFFB0CCC9),
    onSecondary: Color(0xFF1C3533),
    secondaryContainer: Color(0xFF324B49),
    onSecondaryContainer: Color(0xFFCCE8E5),
    tertiary: Color(0xFFB0C9E7),
    onTertiary: Color(0xFF19324A),
    tertiaryContainer: Color(0xFF304962),
    onTertiaryContainer: Color(0xFFD0E4FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1C),
    onBackground: Color(0xFFE0E3E2),
    surface: Color(0xFF191C1C),
    onSurface: Color(0xFFE0E3E2),
    surfaceVariant: Color(0xFF3F4947),
    onSurfaceVariant: Color(0xFFBEC9C7),
    outline: Color(0xFF889391),
    onInverseSurface: Color(0xFF191C1C),
    inverseSurface: Color(0xFFE0E3E2),
    inversePrimary: Color(0xFF006A65),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4FDAD2),
    outlineVariant: Color(0xFF3F4947),
    scrim: Color(0xFF000000),
  );
}
