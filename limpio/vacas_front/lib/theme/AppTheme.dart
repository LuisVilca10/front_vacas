import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();
    static  List<Color> colorOptions = [
    Colors.grey,
    Colors.blue
  ];
  static   List<String> colorText = <String>[
    "Plomo",
    "Azul",

  ];

  static List<Color> colorOptionsLD = <Color>[Colors.grey, Colors.blue];
  static List<String> colorTextLD = <String>["Plomo", "Azul"];

  static List<ColorScheme> colorOptionsShemeL = [
    lightColorScheme,
    lightColorSchemeBlue,
  ];
  static List<ColorScheme> colorOptionsShemeD = [
    darkColorScheme,
    darkColorSchemeBlue

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
  static const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6750A4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  onPrimaryContainer: Color(0xFF21005D),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  onSecondaryContainer: Color(0xFF1D192B),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onErrorContainer: Color(0xFF410E0B),
  outline: Color(0xFF79747E),
  background: Color(0xFFFFFBFE),
  onBackground: Color(0xFF1C1B1F),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  inverseSurface: Color(0xFF313033),
  onInverseSurface: Color(0xFFF4EFF4),
  inversePrimary: Color(0xFFD0BCFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF6750A4),
  outlineVariant: Color(0xFFCAC4D0),
  scrim: Color(0xFF000000),
);

static const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8C1D18),
  onErrorContainer: Color(0xFFF9DEDC),
  outline: Color(0xFF938F99),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  inverseSurface: Color(0xFFE6E1E5),
  onInverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFD0BCFF),
  outlineVariant: Color(0xFF49454F),
  scrim: Color(0xFF000000),
);
  static const lightColorSchemeBlue = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0062A1),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD0E4FF),
    onPrimaryContainer: Color(0xFF001D35),
    secondary: Color(0xFF525F70),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD6E4F7),
    onSecondaryContainer: Color(0xFF0F1D2A),
    tertiary: Color(0xFF2E5DA8),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD7E2FF),
    onTertiaryContainer: Color(0xFF001A40),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFCFF),
    onBackground: Color(0xFF1A1C1E),
    surface: Color(0xFFFDFCFF),
    onSurface: Color(0xFF1A1C1E),
    surfaceVariant: Color(0xFFDFE3EB),
    onSurfaceVariant: Color(0xFF42474E),
    outline: Color(0xFF73777F),
    onInverseSurface: Color(0xFFF1F0F4),
    inverseSurface: Color(0xFF2F3033),
    inversePrimary: Color(0xFF9CCAFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF0062A1),
    outlineVariant: Color(0xFFC2C7CF),
    scrim: Color(0xFF000000),
  );

  static const darkColorSchemeBlue = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF9CCAFF),
    onPrimary: Color(0xFF003256),
    primaryContainer: Color(0xFF00497B),
    onPrimaryContainer: Color(0xFFD0E4FF),
    secondary: Color(0xFFBAC8DB),
    onSecondary: Color(0xFF243140),
    secondaryContainer: Color(0xFF3B4857),
    onSecondaryContainer: Color(0xFFD6E4F7),
    tertiary: Color(0xFFACC7FF),
    onTertiary: Color(0xFF002F67),
    tertiaryContainer: Color(0xFF08458E),
    onTertiaryContainer: Color(0xFFD7E2FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C1E),
    onBackground: Color(0xFFE2E2E6),
    surface: Color(0xFF1A1C1E),
    onSurface: Color(0xFFE2E2E6),
    surfaceVariant: Color(0xFF42474E),
    onSurfaceVariant: Color(0xFFC2C7CF),
    outline: Color(0xFF8C9199),
    onInverseSurface: Color(0xFF1A1C1E),
    inverseSurface: Color(0xFFE2E2E6),
    inversePrimary: Color(0xFF0062A1),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF9CCAFF),
    outlineVariant: Color(0xFF42474E),
    scrim: Color(0xFF000000),
  );

}