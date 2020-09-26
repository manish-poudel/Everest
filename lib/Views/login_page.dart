import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/Models/login_page_model.dart';
import 'package:everest/Views/registration_page.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:everest/Widgets/dashed_text_widget.dart';
import 'package:everest/Widgets/login_widget.dart';
import 'package:flutter/material.dart';

/// Login view page to handle authentication
///@author Manish Poudel
///@createdAt 9/23/2020
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static LoginPageModel _loginPageModel;
  @override
  void initState() {
    super.initState();
    _loginPageModel = LoginPageModel(context);
  }

  /// On sign with email and password after sign in button is clicked. We try to authenticate user using firebase auth.
  /// @param email and password which we get from text field of login widget
  _onSignInWithEmailAndPassword(email, password) {
    _loginPageModel
        .signInWithEmailAndPassword(email, password)
        .then((value) => null)
        .catchError((err) {
      _handleLoginError(err.code);
    });
  }

  /// Handle login error using error code sent by firebase authentication.
  /// @param error code
  _handleLoginError(String errorCode)
  {
    String errorMsg = _loginPageModel.getReadableLoginErrMsg(errorCode);
    print(errorMsg);
  }

  /// On password forgot button clicked
  _onPasswordForgot() {

  }

  @override
  Widget build(BuildContext context) {
    final double standardPadding = ScreenUtility.getStandardPadding(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: ScreenUtility.getScreenHeight(context),
            color: Colors.white70,
            padding: EdgeInsets.only(
                left: standardPadding,
                right: standardPadding,
                top: ScreenUtility.getStatusBarHeight(context) * 1.5),
            width: ScreenUtility.getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLogo(),
                    FlatButton(
                      onPressed: () => ViewUtility.pushReplacement(
                          context, RegistrationPage()),
                      child: Text(
                        "JOIN NOW",
                        style: TextStyle(
                            color: LightThemeColor.primaryColor,
                            fontSize:
                                ScreenUtility.getStandardSize8(context) * 2,
                            fontFamily: _loginPageModel.appConfig.fontFamily),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: standardPadding * 2,
                      right: standardPadding * 2,
                      top: standardPadding * 3),
                  child: LoginWidget(
                      onLogin: _onSignInWithEmailAndPassword,
                      onPasswordForgot: _onPasswordForgot,
                      emailValidator: _loginPageModel.emailValidator,
                      passwordValidator: _loginPageModel.passwordValidator),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: standardPadding * 1,
                      bottom: standardPadding * 1,
                      right: standardPadding,
                      left: standardPadding),
                  child: DashedTextWidget(
                    lineHeight: 1,
                    lineWidth: 1,
                    text: "OR",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: standardPadding * 2, right: standardPadding * 2),
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
                  padding: EdgeInsets.only(top: standardPadding * 3),
                  child: Center(
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize:
                                ScreenUtility.getStandardSize8(context) * 2,
                            fontFamily: _loginPageModel.appConfig.fontFamily),
                      ),
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
