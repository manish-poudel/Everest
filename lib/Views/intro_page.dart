import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Resources/app_string_resources.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/login_page.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:flutter/material.dart';

/// First time intro page of the app. Allows user to see what app is all about with sign in and sign up options.
/// @author Manish Poudel
/// @createdAt 9/24/2020
class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  double _illustrativeImgHeight;
  double _illustrativeImgWidth;
  double _standardPadding;


  @override
  Widget build(BuildContext context) {
    /// Height and width of app logo
    double appLogoHeight = ScreenUtility.getScreenHeight(context) * 0.08;
    double appLogoWidth = ScreenUtility.getScreenWidth(context) * 0.2;
    /// Height and width of illustrative image
    _illustrativeImgHeight = ScreenUtility.getScreenHeight(context) * 0.37;
    _illustrativeImgWidth = ScreenUtility.getScreenWidth(context);

    _standardPadding = ScreenUtility.getStandardPadding(context);
    AppTheme.setStatusBarLightTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: _standardPadding, right:_standardPadding, top: ScreenUtility.getStatusBarHeight(context)),
          width: ScreenUtility.getScreenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(ImageResources.appLogoPath),
                height: appLogoHeight,
                width: appLogoWidth,
                fit: BoxFit.fitHeight,
              ),
            Padding(
              padding: EdgeInsets.only(top: _standardPadding * 2),
              child: _illustrativeImgWithCaption(),
            ),
              Expanded(child: _buttonsCollection())
            ],
          ),
        ),
      ),
    );
  }


  /// Widget that display illustrative image with caption
  /// @returns Widget
  Widget _illustrativeImgWithCaption()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(ImageResources.introPageIllustrationPath),
          height: _illustrativeImgHeight,
          width: _illustrativeImgWidth,
          fit: BoxFit.fitHeight,
        ),
        _headingWithSubtitle(StringResources.IntroPageImgCaptionMainOne, StringResources.IntroPageImgCaptionSubOne),
        Padding(
          padding: EdgeInsets.only(top:_standardPadding),
          child: _headingWithSubtitle(StringResources.IntroPageImgCaptionMainTwo, StringResources.IntroPageImgCaptionSubTwo),
        ),
      ],
    );
  }

  /// Widget with heading and caption text
  /// @returns Widget
  Widget _headingWithSubtitle(String heading, String subtitle)
  {
    return Column(
      children: [
        Text(heading,
            style: TextStyle(
                fontSize: ScreenUtility.getStandardSize8(context) * 2,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500)),
        Text(subtitle,
            style: TextStyle(
                fontSize:
                ScreenUtility.getStandardSize8(context) * 1.5,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300)),
      ],
    );
  }

  /// All the button on the intro page
  /// @returns Widget with list of rounded buttons
  Widget _buttonsCollection()
  {
    return Container(
      padding: EdgeInsets.only(left: _standardPadding, right: _standardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedFlatButton(
            onClick: _onJoinNowBtnPressed,
            width: ScreenUtility.getScreenWidth(context),
            text: "Join now",
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            borderColor: Colors.blue,
          ),
          Padding(
            padding:EdgeInsets.only(top:_standardPadding, bottom: _standardPadding),
            child: RoundedFlatButton(
              onClick: _onJoinNowBtnPressed,
              width: ScreenUtility.getScreenWidth(context),
              text: "Join with google",
              textColor: Colors.black54,
              backgroundColor: Colors.white,
              borderColor: Colors.black54,
              icon: Icon(CustomIcons.google, color: Colors.blue),
            ),
          ),
          RoundedFlatButton(
            onClick: _onLoginButtonPressed,
            width: ScreenUtility.getScreenWidth(context),
            text: "Login",
            textColor: Colors.black54,
            backgroundColor: Colors.white,
            borderColor: Colors.black54,
          ),
        ],
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
