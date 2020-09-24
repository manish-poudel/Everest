import 'package:flutter/cupertino.dart';

/// Screen utility class that provides helper function related to screen sizes
/// @author Manish Poudel
/// @createdAt 9/24/2020

class ScreenUtility{

  /// Get height of the screen
  /// @param context of the current screen
  /// @returns double
  static double getScreenHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

  /// Get height of the screen
  /// @param context of the current screen
  /// @returns double
  static double getScreenWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

  /// Get status bar height
  /// @param context of the current screen
  /// @returns double
  static double getStatusBarHeight(BuildContext context)
  {
    return MediaQuery.of(context).padding.top;
  }

  /// Get standard padding for the app
  /// @param context of the current screen
  /// @returns double
  static double getStandardPadding(BuildContext context)
  {
     return getScreenHeight(context) * 0.012;
  }

  /// Get standard text size of 8 based on the screen size for the app
  /// @param context of the current screen
  /// @returns double
  static double getStandardSize8(BuildContext context)
  {
    return getScreenHeight(context) * 0.012;
  }

}