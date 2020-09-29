import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:flutter/material.dart';

/// App logo
/// @author Manish Poudel
/// @createdAt 9/25/2020
class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Height and width of app logo
    double appLogoHeight = ScreenUtility.getScreenHeight(context) * 0.08;
    double appLogoWidth = ScreenUtility.getScreenWidth(context) * 0.2;
    return Image(
      image: AssetImage(ImageResources.appLogoPath),
      height: appLogoHeight,
      width: appLogoWidth,
      fit: BoxFit.fitHeight,
    );
  }
}
