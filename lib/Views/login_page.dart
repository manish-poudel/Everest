import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Widgets/custom_buttons.dart';
import 'package:everest/Widgets/custom_dashedtext_widget.dart';
import 'package:everest/Widgets/custom_login_widget.dart';
import 'package:everest/Widgets/custom_textbox.dart';
import 'package:flutter/material.dart';

/// Login view page to handle authentication
///@author Manish Poudel
///@createdAt 9/23/2020
class LoginPage extends StatelessWidget {
  static const String _loginPageBannerImgPath =
      "assets/images/login_page_banner.png";

  @override
  Widget build(BuildContext context) {
    /// Height and width of app logo
    double appLogoHeight = ScreenUtility.getScreenHeight(context) * 0.17;
    double appLogoWidth = ScreenUtility.getScreenWidth(context) * 0.2;
    double standardPadding = ScreenUtility.getStandardPadding(context);

    CustomLoginWidget customLoginWidget = CustomLoginWidget();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          padding:
              EdgeInsets.only(left: standardPadding, right: standardPadding),
          width: ScreenUtility.getScreenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(ImageResources.appLogoPath),
                height: appLogoHeight,
                width: appLogoWidth,
              ),
              customLoginWidget,
              Padding(
                padding: EdgeInsets.only(top:standardPadding * 2, bottom: standardPadding * 2),
                child: CustomDashedTextWidget(lineHeight: 1, lineWidth: 1,text: "OR",),
              ),
              Padding(
                padding:  EdgeInsets.only(left: standardPadding, right: standardPadding),
                child: CustomRoundedButton(
                  onClick: null,
                  width: ScreenUtility.getScreenWidth(context),
                  text: "Login with google",
                  textColor: Colors.black54,
                  backgroundColor: Colors.white,
                  borderColor: Colors.black54,
                  icon: Icon(CustomIcons.google, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
