import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Class that provides textbox
/// @author Manish Poudel
/// @createdAt 9/24/2020

class SimpleTextBoxWidget extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;

  /// Get the value that was typed
  /// @returns String
  String getText() {
    return _textEditingController.text;
  }

  SimpleTextBoxWidget({@required this.hintText, @required this.obscureText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
        primaryColor: LightThemeColor.primaryColor,
        hintColor: Colors.grey,
      ),
      child: TextField(

        style: TextStyle(color: Colors.grey, fontSize: ScreenUtility.getStandardSize8(context) * 2, fontFamily: 'Montserrat'),
        obscureText: obscureText,
        controller: _textEditingController,
        decoration: new InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            hintStyle: new TextStyle(color: Colors.grey[800]),
            hintText: hintText,
            fillColor: Colors.white70),
      ),
    );
  }
}
