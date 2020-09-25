import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:flutter/material.dart';

/// Register view page to handle registration
///@author Manish Poudel
///@createdAt 9/24/2020
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  double _standardPadding;
  @override
  Widget build(BuildContext context) {
    _standardPadding = ScreenUtility.getStandardPadding(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: Scaffold(
        body: Container(
            height: ScreenUtility.getScreenHeight(context),
         width: ScreenUtility.getScreenWidth(context),
          color: Colors.white70,
          padding:
          EdgeInsets.only(left: _standardPadding, right: _standardPadding, top:ScreenUtility.getStatusBarHeight(context) * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLogo(),

            ],
          )
        ),
      ),
    );
  }
}
