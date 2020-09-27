import 'package:everest/AppTheme/app_theme_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppThemeType type;
  Color primarySwatch;
  Color primaryColor;
  Color backgroundColor;
  Color indicatorColor;
  Color buttonColor;
  Color hintColor;
  Color highlightColor;
  Color hoverColor;
  Color focusColor;
  Color disabledColor;
  Color textSelectionColor;
  Color cardColor;
  Color canvasColor;
  Brightness brightness;
  ColorScheme colorScheme;

  AppTheme({@required this.type}){
    _initTheme();
  }

  _initLightTheme() {
    primarySwatch = Colors.blue;
    primaryColor = Color(0xFF06446C);
    backgroundColor = Color(0xffF1F5FB);
    indicatorColor = Color(0xffCBDCF8);
    buttonColor = Color(0xffF1F5FB);
    hintColor = Color(0xffEECED3);
    highlightColor = Color(0xffFCE192);
    hoverColor = Color(0xff4285F4);
    focusColor = Color(0xffA8DAB5);
    disabledColor = Colors.grey;
    textSelectionColor = Colors.black;
    cardColor = Colors.white;
    canvasColor = Colors.grey[50];
    brightness = Brightness.light;
    colorScheme = ColorScheme.light();
  }

  _initDarkTheme() {
    primarySwatch = Colors.red;
    primaryColor = Colors.black;
    backgroundColor = Colors.black;
    indicatorColor = Color(0xff0E1D36);
    buttonColor = Color(0xff3B3B3B);
    hintColor = Color(0xff280C0B);
    highlightColor = Color(0xff372901);
    hoverColor = Color(0xff3A3A3B);
    focusColor = Color(0xff0B2512);
    disabledColor = Colors.grey;
    textSelectionColor = Colors.white;
    cardColor = Color(0xFF151515);
    canvasColor = Colors.black;
    brightness = Brightness.dark;
    colorScheme = ColorScheme.dark();
  }

  /// Init theme based on the type - dark or light
  _initTheme() {
    type == AppThemeType.light ? _initLightTheme() : _initDarkTheme();
  }

  /// Get theme data
  /// @params context
  /// @returns ThemeData
  ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: primarySwatch,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      indicatorColor: indicatorColor,
      buttonColor: buttonColor,
      hintColor: hintColor,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      focusColor: focusColor,
      disabledColor: disabledColor,
      textSelectionColor: textSelectionColor,
      cardColor: cardColor,
      canvasColor: canvasColor,
      brightness: brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme:
          Theme.of(context).buttonTheme.copyWith(colorScheme: colorScheme),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }

  /// Get status bar light theme
  void setStatusBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light));
  }
}
