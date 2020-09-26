import 'package:everest/Resources/regex.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Widgets/Models/simple_textbox_model.dart';
import 'package:everest/Widgets/simple_textbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'rounded_flat_buttons.dart';

/// Class that provides login widget
/// @author Manish Poudel
/// @createdAt 9/24/2020
class LoginWidget extends StatefulWidget {
  final Function onLogin;
  final Function onPasswordForgot;
  final String Function(String) emailValidator ;
  final String Function(String) passwordValidator;

  LoginWidget({@required this.onLogin, @required this.onPasswordForgot, this.emailValidator, this.passwordValidator});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  SimpleTextBoxModel _emailTextBoxModel;
  SimpleTextBoxModel _passwordTextBoxModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailTextBoxModel = SimpleTextBoxModel(
        hintText: "Email",
        validator: widget.emailValidator);
    _passwordTextBoxModel = SimpleTextBoxModel(
        obscureText: true,
        hintText: "Password",
        validator: widget.passwordValidator,
        suffixIcon: Icons.visibility_off,
        onSuffixIconButtonPressed: _onPasswordTextBoxSuffixIconButtonClicked);
  }

  /// On password text box suffix icon button clicked
  void _onPasswordTextBoxSuffixIconButtonClicked() {
    _passwordTextBoxModel.obscureText = !_passwordTextBoxModel.obscureText;
    _passwordTextBoxModel.suffixIcon = _passwordTextBoxModel.obscureText
        ? Icons.visibility_off
        : Icons.visibility;
  }


  @override
  Widget build(BuildContext context) {
    double standardPadding = ScreenUtility.getStandardPadding(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign in",
            style: TextStyle(
                fontSize: ScreenUtility.getStandardSize8(context) * 3,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: standardPadding * 2),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _emailTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _passwordTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: standardPadding, bottom: standardPadding * 2.5),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () => Function.apply(widget.onPasswordForgot, []),
              child: Text("Forgot password?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtility.getStandardSize8(context) * 2,
                      fontFamily: 'Montserrat')),
            ),
          ),
          RoundedFlatButton(
            onClick: () {
              if (_formKey.currentState.validate()) {
                Function.apply(widget.onLogin,
                    [_emailTextBoxModel.textEditingController.text.trim(),
                      _passwordTextBoxModel.textEditingController.text.trim()]);
              }
            },
            width: ScreenUtility.getScreenWidth(context),
            text: "Login",
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            borderColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
