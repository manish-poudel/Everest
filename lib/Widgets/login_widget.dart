import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Widgets/simple_textbox.dart';
import 'package:flutter/material.dart';

import 'rounded_flat_buttons.dart';

/// Class that provides login widget
/// @author Manish Poudel
/// @createdAt 9/24/2020

class LoginWidget extends StatefulWidget {

  final Function onLogin;
  final Function onPasswordForgot;

  LoginWidget({@required this.onLogin, @required this.onPasswordForgot});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

   bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double standardPadding = ScreenUtility.getStandardPadding(context);
    SimpleTextBoxWidget emailTextBox = SimpleTextBoxWidget(obscureText: false, hintText: "Email");
    SimpleTextBoxWidget passwordTextBox = SimpleTextBoxWidget(obscureText: obscurePassword, hintText: "Password",
        suffixIcon: IconButton(icon: obscurePassword?Icon(Icons.visibility_off, color: Colors.grey):Icon(Icons.visibility, color: Colors.grey), onPressed: (){
          setState(() {
            obscurePassword = !obscurePassword;
          });
        }));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left:standardPadding, right: standardPadding),
          child:  Text("Sign in",style: TextStyle(fontSize: ScreenUtility.getStandardSize8(context) * 3, fontFamily: 'Montserrat',  fontWeight: FontWeight.w600),),
        ),
        Padding(
          padding:  EdgeInsets.only(top:standardPadding * 2, left: standardPadding, right: standardPadding),
          child: emailTextBox,
        ),
        Padding(
          padding:  EdgeInsets.only(top:standardPadding, left: standardPadding, right: standardPadding),
          child: passwordTextBox,
        ),

        Padding(
          padding: EdgeInsets.only(top:standardPadding * 2, bottom: standardPadding * 2),
          child: FlatButton(
            onPressed: () => Function.apply(widget.onPasswordForgot, []),
            child: Text("Forgot password?", style: TextStyle(color: Colors.grey, fontSize: ScreenUtility.getStandardSize8(context) * 2, fontFamily: 'Montserrat')),
          ),
        ),

        Padding(
          padding:EdgeInsets.only(left: standardPadding, right:standardPadding),
          child: RoundedFlatButton(
            onClick: widget.onLogin,
            width: ScreenUtility.getScreenWidth(context),
            text: "Login",
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            borderColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
