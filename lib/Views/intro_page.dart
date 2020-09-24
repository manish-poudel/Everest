import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Resources/app_string_resources.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/login_page.dart';
import 'package:everest/Widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

/// First time intro page of the app. Allows user to see what app is all about with sign in and sign up options.
/// @author Manish Poudel
/// @createdAt 9/24/2020
class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    /// Height and width of app logo
    double appLogoHeight = ScreenUtility.getScreenHeight(context) * 0.17;
    double appLogoWidth = ScreenUtility.getScreenWidth(context) * 0.2;

    /// Height and width of illustrative image
    double illustrativeImgHeight =
        ScreenUtility.getScreenHeight(context) * 0.37;
    double illustrativeImgWidth = ScreenUtility.getScreenWidth(context);

    double standardPadding = ScreenUtility.getStandardPadding(context);

    AppTheme.setStatusBarLightTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: standardPadding, right:standardPadding),
          width: ScreenUtility.getScreenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(ImageResources.appLogoPath),
                height: appLogoHeight,
                width: appLogoWidth,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(ImageResources.introPageIllustrationPath),
                    height: illustrativeImgHeight,
                    width: illustrativeImgWidth,
                    fit: BoxFit.fitHeight,
                  )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: standardPadding * 2.4),
                child: Text(StringResources.IntroPageImgCaptionMainOne,
                    style: TextStyle(
                        fontSize: ScreenUtility.getStandardSize8(context) * 2,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500)),
              )),
              Center(
                  child: Text(StringResources.IntroPageImgCaptionSubOne,
                      style: TextStyle(
                          fontSize:
                              ScreenUtility.getStandardSize8(context) * 1.5,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300))),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: standardPadding),
                child: Text(StringResources.IntroPageImgCaptionMainTwo,
                    style: TextStyle(
                        fontSize: ScreenUtility.getStandardSize8(context) * 2,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500)),
              )),
              Center(
                  child: Text(StringResources.IntroPageImgCaptionSubTwo,
                      style: TextStyle(
                          fontSize:
                              ScreenUtility.getStandardSize8(context) * 1.5,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300))),
              Padding(
                padding: EdgeInsets.only(
                    top: standardPadding * 4,
                    left: standardPadding * 2,
                    right: standardPadding * 2),
                child: Column(
                  children: [
                    CustomRoundedButton(
                      onClick: _onJoinNowBtnPressed,
                      width: ScreenUtility.getScreenWidth(context),
                      text: "Join now",
                      textColor: Colors.white,
                      backgroundColor: Colors.blue,
                      borderColor: Colors.blue,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:ScreenUtility.getStandardPadding(context)),
                      child: CustomRoundedButton(
                        onClick: _onJoinNowBtnPressed,
                        width: ScreenUtility.getScreenWidth(context),
                        text: "Join with google",
                        textColor: Colors.black54,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black54,
                        icon: Icon(CustomIcons.google, color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:ScreenUtility.getStandardPadding(context)),
                      child: CustomRoundedButton(
                        onClick: _onLoginButtonPressed,
                        width: ScreenUtility.getScreenWidth(context),
                        text: "Login",
                        textColor: Colors.black54,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Call back function handler when join now button is pressed
  _onJoinNowBtnPressed() {
    print("Pressed");
  }

  /// Call back function handler when login in button is pressed
  _onLoginButtonPressed()
  {
    ViewUtility.navigateToPage(context, LoginPage());
  }
}
