import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Views/Models/registration_page_model.dart';
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

  RegistrationWidget({@required this.onRegister, this.emailValidator, this.passwordValidator});

  static SimpleTextBoxModel _emailTextBoxModel;
  static SimpleTextBoxModel _passwordTextBoxModel;
  static SimpleTextBoxModel _passwordAgainTextBoxModel;

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _agreement = false;

  @override
  void initState() {
    super.initState();

    _initializeTextBoxes();
  }

  /// Initialize all text boxes
  _initializeTextBoxes()
  {
    RegistrationWidget._emailTextBoxModel = SimpleTextBoxModel(
        hintText: "Email",
        validator: widget.emailValidator);

    RegistrationWidget._passwordTextBoxModel = SimpleTextBoxModel(
        obscureText: true,
        hintText: "Password",
        validator: widget.passwordValidator == null?null:(value) => widget.passwordValidator(value, RegistrationWidget._passwordAgainTextBoxModel.textEditingController.text),
        suffixIcon: Icons.visibility_off,
        onSuffixIconButtonPressed: _onPasswordTextBoxSuffixIconButtonClicked);

    RegistrationWidget._passwordAgainTextBoxModel = SimpleTextBoxModel(
        obscureText: true,
        hintText: "Password Again",
        validator:widget.passwordValidator == null?null:(value) => widget.passwordValidator(value,RegistrationWidget._passwordTextBoxModel.textEditingController.text),
        suffixIcon: Icons.visibility_off,
        onSuffixIconButtonPressed: _onPasswordAgainTextBoxSuffixIconButtonClicked);
  }

  /// On password text box suffix icon button clicked
  void _onPasswordTextBoxSuffixIconButtonClicked() {
    RegistrationWidget._passwordTextBoxModel.obscureText = !RegistrationWidget._passwordTextBoxModel.obscureText;
    RegistrationWidget._passwordTextBoxModel.suffixIcon = RegistrationWidget._passwordTextBoxModel.obscureText
        ? Icons.visibility_off
        : Icons.visibility;
  }

  /// On password text box suffix icon button clicked
  void _onPasswordAgainTextBoxSuffixIconButtonClicked() {
    RegistrationWidget._passwordAgainTextBoxModel.obscureText = !RegistrationWidget._passwordAgainTextBoxModel.obscureText;
    RegistrationWidget._passwordAgainTextBoxModel.suffixIcon = RegistrationWidget._passwordAgainTextBoxModel.obscureText
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
            "Sign up",
            style: TextStyle(
                fontSize: ScreenUtility.getStandardSize8(context) * 3,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: standardPadding * 2),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => RegistrationWidget._emailTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => RegistrationWidget._passwordTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => RegistrationWidget._passwordAgainTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),

          Padding(
            padding:  EdgeInsets.only(top:standardPadding),
            child: CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("By signing in, you agree to our terms and condition",
                style: TextStyle(fontFamily: 'Montserrat',
                    fontSize: ScreenUtility.getStandardSize8(context)* 1.6),),
              value: _agreement,
              onChanged: (newValue) {
                setState(() {
                    _agreement = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top:standardPadding * 2),
            child: RoundedFlatButton(
              enable: _agreement,
              onClick: () {
                if (_formKey.currentState.validate()) {
                  Function.apply(widget.onRegister,
                      [RegistrationWidget._emailTextBoxModel.textEditingController.text.trim(),
                        RegistrationWidget._passwordTextBoxModel.textEditingController.text.trim()]);
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
