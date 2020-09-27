import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Widgets/Models/simple_textbox_model.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:everest/Widgets/simple_textbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Class that provides registration widget
/// @author Manish Poudel
/// @createdAt 9/24/2020

class RegistrationWidget extends StatefulWidget {
  final Function onRegister;
  final String Function(String) emailValidator;
  final String Function(String, String) passwordValidator;

  RegistrationWidget(
      {@required this.onRegister,
      this.emailValidator,
      this.passwordValidator,
      });

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _agreement = false;

  SimpleTextBoxModel _emailTextBoxModel;
  SimpleTextBoxModel _passwordTextBoxModel;
  SimpleTextBoxModel _passwordAgainTextBoxModel;
  double _standardPadding;
  AppConfig _appConfig;

  @override
  void initState() {
    super.initState();
    _initializeTextBoxes();
  }

  /// Initialize all text boxes
  _initializeTextBoxes() {
    _emailTextBoxModel =
        SimpleTextBoxModel(hintText: "Email", validator: widget.emailValidator);

    _passwordTextBoxModel = SimpleTextBoxModel(
        obscureText: true,
        hintText: "Password",
        validator: widget.passwordValidator == null
            ? null
            : (value) => widget.passwordValidator(
                value, _passwordAgainTextBoxModel.textEditingController.text),
        suffixIcon: Icons.visibility_off,
        onSuffixIconButtonPressed: _onPasswordTextBoxSuffixIconButtonClicked);

    _passwordAgainTextBoxModel = SimpleTextBoxModel(
        obscureText: true,
        hintText: "Password Again",
        validator: widget.passwordValidator == null
            ? null
            : (value) => widget.passwordValidator(
                value, _passwordTextBoxModel.textEditingController.text),
        suffixIcon: Icons.visibility_off,
        onSuffixIconButtonPressed:
            _onPasswordAgainTextBoxSuffixIconButtonClicked);
  }

  /// On password text box suffix icon button clicked
  void _onPasswordTextBoxSuffixIconButtonClicked() {
    _passwordTextBoxModel.obscureText = !_passwordTextBoxModel.obscureText;
    _passwordTextBoxModel.suffixIcon = _passwordTextBoxModel.obscureText
        ? Icons.visibility_off
        : Icons.visibility;
  }

  /// On password text box suffix icon button clicked
  void _onPasswordAgainTextBoxSuffixIconButtonClicked() {
    _passwordAgainTextBoxModel.obscureText =
        !_passwordAgainTextBoxModel.obscureText;
    _passwordAgainTextBoxModel.suffixIcon =
        _passwordAgainTextBoxModel.obscureText
            ? Icons.visibility_off
            : Icons.visibility;
  }

  @override
  Widget build(BuildContext context) {
    _standardPadding = ScreenUtility.getStandardPadding(context);
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign up",
            style: TextStyle(
                fontSize: ScreenUtility.getStandardSize8(context) * 3,
                fontFamily: _appConfig.fontFamily,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _emailTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _passwordTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _passwordAgainTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding),
            child: CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "By signing up, you agree to our terms and conditions",
                style: TextStyle(
                    fontFamily: _appConfig.fontFamily,
                    fontSize: ScreenUtility.getStandardSize8(context) * 1.6),
              ),
              value: _agreement,
              onChanged: (newValue) {
                setState(() {
                  _agreement = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding * 2),
            child: RoundedFlatButton(
              enable: _agreement,
              onClick: () {
                if (_formKey.currentState.validate()) {
                  Function.apply(widget.onRegister, [
                    _emailTextBoxModel.textEditingController.text.trim(),
                    _passwordTextBoxModel.textEditingController.text.trim(),
                  ]);
                }
              },
              width: ScreenUtility.getScreenWidth(context),
              text: "Register",
              textColor: Colors.white,
              backgroundColor: Colors.blue,
              borderColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
