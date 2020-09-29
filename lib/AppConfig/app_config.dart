import 'package:everest/AppConfig/flavor.dart';
import 'package:everest/AppTheme/app_theme.dart';
import 'package:flutter/foundation.dart';

/// Class to hold app major configurations
/// @author Manish Poudel
/// @createdAt 9/25/2020
class AppConfig {
  Flavor flavor;
  String apiBasePath;
  String fontFamily;
  AppTheme appTheme;

  AppConfig(
      {@required this.flavor,
      @required this.apiBasePath,
      @required this.fontFamily,
      @required this.appTheme})
      : assert(flavor != null),
        assert(apiBasePath != null),
        assert(fontFamily != null);
}
