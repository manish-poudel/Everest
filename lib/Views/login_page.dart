import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Utilities/view_utility.dart';
import 'package:everest/Views/Models/login_page_model.dart';
import 'package:everest/Views/registration_page.dart';
import 'package:everest/Widgets/alert_dialogbox.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:everest/Widgets/progress_info_widget.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:everest/Widgets/dashed_text_widget.dart';
import 'package:everest/Widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Login view page to handle authentication
///@author Manish Poudel
///@createdAt 9/23/2020
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static LoginPageModel _loginPageModel;
  AppConfig _appConfig;
  double _standardPadding;

  @override
  void initState() {
    super.initState();
    _loginPageModel = LoginPageModel(context);
  }

  /// On sign with email and password after sign in button is clicked. We try to authenticate user using firebase auth.
  /// @param email and password which we get from text field of login widget
  _onSignInWithEmailAndPassword(email, password) {
    ProgressInfo progressInfo =
        ProgressInfo(context: context, content: "Signing in");
    progressInfo.show();
    _loginPageModel
        .signInWithEmailAndPassword(email, password)
        .then((value) => progressInfo.dismiss())
        .catchError((err) {
      progressInfo.dismiss();
      _handleLoginError(err.code);
    });
  }

  /// Handle login error using error code sent by firebase authentication.
  /// @param error code
  _handleLoginError(String errorCode) {
    String errorMsg = _loginPageModel.getReadableLoginErrMsg(errorCode);
    DialogBox(context: context, heading: "Login failure", content: errorMsg)
        .show();
  }

  /// On password forgot button clicked
  _onPasswordForgot() {
    ProgressInfo progressInfo =
        ProgressInfo(context: context, content: "Login in");
    progressInfo.show();
  }

  @override
  Widget build(BuildContext context) {
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    _standardPadding = ScreenUtility.getStandardPadding(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appConfig.appTheme.getThemeData(context),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: _standardPadding,
                right: _standardPadding,
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
                      onPressed: () => ViewUtility.cupertinoPushReplacement(
                          context, RegistrationPage()),
                      child: Text(
                        "JOIN NOW",
                        style: TextStyle(
                            color: _appConfig.appTheme.primaryColor,
                            fontSize:
                                ScreenUtility.getStandardSize8(context) * 2,
                            fontFamily: _appConfig.fontFamily),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: _standardPadding * 2,
                      right: _standardPadding * 2,
                      top: _standardPadding * 3),
                  child: LoginWidget(
                      onLogin: _onSignInWithEmailAndPassword,
                      onPasswordForgot: _onPasswordForgot,
                      emailValidator: _loginPageModel.emailValidator,
                      passwordValidator: _loginPageModel.passwordValidator),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _standardPadding * 1,
                      bottom: _standardPadding * 1,
                      right: _standardPadding,
                      left: _standardPadding),
                  child: DashedTextWidget(
                    lineHeight: 1,
                    lineWidth: 1,
                    text: "OR",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: _standardPadding * 2, right: _standardPadding * 2),
                  child: RoundedFlatButton(
                    onClick: null,
                    width: ScreenUtility.getScreenWidth(context),
                    text: "Sign in with google",
                    textColor: Colors.black54,
                    backgroundColor: Colors.white,
                    borderColor: Colors.black54,
                    icon: Icon(CustomIcons.google, color: Colors.blue),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: standardPadding * 3),
                //   child: Center(
                //     child: IconButton(
                //       onPressed: () => Navigator.of(context).pop(),
                //       icon: Icon(Icons.arrow_back, color: Colors.grey,),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
