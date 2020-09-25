import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/registration_page.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:everest/Widgets/dashed_text_widget.dart';
import 'package:everest/Widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Login view page to handle authentication
///@author Manish Poudel
///@createdAt 9/23/2020
class LoginPage extends StatelessWidget {

  AppConfig _appConfig;
  @override
  Widget build(BuildContext context) {
    /// Height and width of app logo
    double appLogoHeight = ScreenUtility.getScreenHeight(context) * 0.08;
    double appLogoWidth = ScreenUtility.getScreenWidth(context) * 0.2;
    double standardPadding = ScreenUtility.getStandardPadding(context);

    LoginWidget loginWidget = LoginWidget();
    _appConfig = Provider.of<AppConfig>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: ScreenUtility.getScreenHeight(context),
            color: Colors.white70,
            padding:
                EdgeInsets.only(left: standardPadding, right: standardPadding, top:ScreenUtility.getStatusBarHeight(context) * 1.5),
            width: ScreenUtility.getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLogo(),
                    FlatButton(
                      onPressed: () => ViewUtility.pushReplacement(context, RegistrationPage()),
                      child: Text("JOIN NOW",style: TextStyle(color: LightThemeColor.primaryColor, fontSize: ScreenUtility.getStandardSize8(context) * 2, fontFamily: _appConfig.fontFamily),),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left:standardPadding * 2, right: standardPadding * 2, top: standardPadding * 3),
                  child: loginWidget,
                ),
                Padding(
                  padding: EdgeInsets.only(top:standardPadding * 1, bottom: standardPadding * 1, right: standardPadding, left: standardPadding),
                  child: DashedTextWidget(lineHeight: 1, lineWidth: 1,text: "OR",),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: standardPadding * 2, right: standardPadding * 2),
                  child: RoundedFlatButton(
                    onClick: null,
                    width: ScreenUtility.getScreenWidth(context),
                    text: "Login with google",
                    textColor: Colors.black54,
                    backgroundColor: Colors.white,
                    borderColor: Colors.black54,
                    icon: Icon(CustomIcons.google, color: Colors.blue),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:standardPadding * 3),
                  child: Center(
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Back",style: TextStyle(color: Colors.grey, fontSize: ScreenUtility.getStandardSize8(context) * 2, fontFamily: _appConfig.fontFamily),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
