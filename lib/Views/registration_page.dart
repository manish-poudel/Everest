import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Resources/custom_icons.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/Models/registration_page_model.dart';
import 'package:everest/Views/login_page.dart';
import 'package:everest/Widgets/alert_dialogbox.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:everest/Widgets/dashed_text_widget.dart';
import 'package:everest/Widgets/registration_widget.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Register view page to handle registration
///@author Manish Poudel
///@createdAt 9/24/2020
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  double _standardPadding;
  RegistrationPageModel _registrationPageModel;
  AppConfig _appConfig;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registrationPageModel = RegistrationPageModel(context);
  }

  /// On register clicked
  _onRegisterClicked(String email, String password) {
    _registrationPageModel
        .registerWithEmailAndPassword(email, password)
        .then((value) => null)
        .catchError((err) {
      _handleLoginError(err.code);
    });
  }

  /// Handle login error using error code sent by firebase authentication.
  /// @param error code
  _handleLoginError(String errorCode) {
    String errorMsg = _registrationPageModel.getReadableLoginErrMsg(errorCode);
    DialogBox(
            context: context,
            heading: "Registration failure",
            content: errorMsg)
        .show();
  }

  @override
  Widget build(BuildContext context) {
    _standardPadding = ScreenUtility.getStandardPadding(context);
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appConfig.appTheme.getThemeData(context),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              width: ScreenUtility.getScreenWidth(context),
              padding: EdgeInsets.only(
                  left: _standardPadding,
                  right: _standardPadding,
                  top: ScreenUtility.getStatusBarHeight(context) * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLogo(),
                      FlatButton(
                        onPressed: () =>
                            ViewUtility.cupertinoPushReplacement(context, LoginPage()),
                        child: Text(
                          "Sign in",
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
                    child: RegistrationWidget(
                        onRegister: _onRegisterClicked,
                        emailValidator: _registrationPageModel.emailValidator,
                        passwordValidator:
                            _registrationPageModel.passwordValidator),
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
                        left: _standardPadding * 2,
                        right: _standardPadding * 2),
                    child: RoundedFlatButton(
                      onClick: null,
                      width: ScreenUtility.getScreenWidth(context),
                      text: "Sign up with google",
                      textColor: Colors.black54,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black54,
                      icon: Icon(CustomIcons.google, color: Colors.blue),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: _standardPadding * 3),
                  //   child: Center(
                  //     child: FlatButton(
                  //       onPressed: () => Navigator.of(context).pop(),
                  //       child: Text(
                  //         "Back",
                  //         style: TextStyle(
                  //             color: Colors.grey,
                  //             fontSize:
                  //             ScreenUtility.getStandardSize8(context) * 2,
                  //             fontFamily: 'Montserrat'),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              )),
        ),
      ),
    );
  }
}
