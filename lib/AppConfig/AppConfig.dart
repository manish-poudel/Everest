import 'package:everest/AppConfig/Flavor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Class to hold app major configurations
/// @author Manish Poudel
/// @createdAt 9/25/2020
class AppConfig{

  Flavor flavor;
  String apiBasePath;
  String fontFamily;

  AppConfig({@required this.flavor,
    @required this.apiBasePath ,
    @required this.fontFamily}):assert(flavor != null), assert(apiBasePath != null), assert(fontFamily != null);

}