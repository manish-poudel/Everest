import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



/// Private class that provides light color value
///@author Manish Poudel
///@createdAt 9/23/2020
class LightThemeColor {
  static const Color primarySwatch = Colors.blue;
  static const Color primaryColor = Color(0xFF06446C);
  static const Color backgroundColor = Color(0xffF1F5FB);
  static const Color indicatorColor = Color(0xffCBDCF8);
  static const Color buttonColor = Color(0xffF1F5FB);
  static const Color hintColor = Color(0xffEECED3);
  static const Color highlightColor = Color(0xffFCE192);
  static const Color hoverColor = Color(0xff4285F4);
  static const Color focusColor = Color(0xffA8DAB5);
  static const Color disabledColor = Colors.grey;
  static const Color textSelectionColor = Colors.black;
  static const Color cardColor = Colors.white;
  static Color canvasColor = Colors.grey[50];
}

/// Private class that provides light color value
///@author Manish Poudel
///@createdAt 9/23/2020
class DarkThemeColor {
     static const Color primarySwatch = Colors.red;
     static const Color primaryColor = Colors.black;
     static const Color backgroundColor = Colors.black;
     static const Color indicatorColor = Color(0xff0E1D36);
     static const Color buttonColor = Color(0xff3B3B3B);
     static const Color hintColor = Color(0xff280C0B);
     static const Color highlightColor = Color(0xff372901);
     static const Color hoverColor = Color(0xff3A3A3B);
     static const Color focusColor = Color(0xff0B2512);
     static const Color disabledColor = Colors.grey;
     static const Color textSelectionColor = Colors.white;
     static const Color cardColor = Color(0xFF151515);
     static Color canvasColor = Colors.black;
}


/// Class that provides either dark or light theme
/// @author Manish Poudel
/// @createdAt 9/23/2020
class AppTheme {

  /// Get light theme
  /// @params context
  /// @returns ThemeData
  static ThemeData light(BuildContext context) {
    return ThemeData(
      primarySwatch: LightThemeColor.primarySwatch,
      primaryColor: LightThemeColor.primaryColor,
      backgroundColor: LightThemeColor.backgroundColor,
      indicatorColor: LightThemeColor.indicatorColor,
      buttonColor: LightThemeColor.buttonColor,
      hintColor: LightThemeColor.hintColor,
      highlightColor: LightThemeColor.highlightColor,
      hoverColor: LightThemeColor.hoverColor,
      focusColor: LightThemeColor.focusColor,
      disabledColor: LightThemeColor.disabledColor,
      textSelectionColor: LightThemeColor.textSelectionColor,
      cardColor: LightThemeColor.cardColor,
      canvasColor: LightThemeColor.canvasColor,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }

  /// Get dark theme
  /// @params context
  /// @returns ThemeData
  static ThemeData dark(BuildContext context) {
       return ThemeData(
            primarySwatch: DarkThemeColor.primarySwatch,
            primaryColor: DarkThemeColor.primaryColor,
            backgroundColor: DarkThemeColor.backgroundColor,
            indicatorColor: DarkThemeColor.indicatorColor,
            buttonColor: DarkThemeColor.buttonColor,
            hintColor: DarkThemeColor.hintColor,
            highlightColor: DarkThemeColor.highlightColor,
            hoverColor: DarkThemeColor.hoverColor,
            focusColor: DarkThemeColor.focusColor,
            disabledColor: DarkThemeColor.disabledColor,
            textSelectionColor: DarkThemeColor.textSelectionColor,
            cardColor: DarkThemeColor.cardColor,
            canvasColor: DarkThemeColor.canvasColor,
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme: Theme.of(context)
                .buttonTheme
                .copyWith(colorScheme: ColorScheme.dark()),
            appBarTheme: AppBarTheme(
                 elevation: 0.0,
            ),
       );
  }

  /// Get status bar light theme
  static setStatusBarLightTheme()
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightThemeColor.primaryColor,
      statusBarIconBrightness: Brightness.light
    ));
  }

  /// Get status bar dark theme
  static setStatusBarDarkTheme()
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: DarkThemeColor.primaryColor ,
        statusBarIconBrightness: Brightness.dark
    ));
  }
}
