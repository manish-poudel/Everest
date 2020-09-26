import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Widgets/Models/simple_textbox_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Class that provides textbox
/// @author Manish Poudel
/// @createdAt 9/24/2020

class SimpleTextBoxWidget extends StatefulWidget {

  SimpleTextBoxWidget();

  @override
  _SimpleTextBoxWidgetState createState() => _SimpleTextBoxWidgetState();
}

class _SimpleTextBoxWidgetState extends State<SimpleTextBoxWidget> {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    return Theme(
      data: new ThemeData(
        primaryColor: LightThemeColor.primaryColor,
        hintColor: Colors.grey,
      ),
      child: Consumer<SimpleTextBoxModel>(
        builder: (context, simpleTextBoxModel, child) {
          return TextFormField(
            validator:  simpleTextBoxModel.validator,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtility.getStandardSize8(context) * 2,
                fontFamily: appConfig.fontFamily),
            obscureText: simpleTextBoxModel.obscureText == null?false:simpleTextBoxModel.obscureText,
            controller: simpleTextBoxModel.textEditingController,
            decoration: new InputDecoration(
                suffixIcon: simpleTextBoxModel.suffixIcon != null?
                    IconButton(
                        icon: Icon(simpleTextBoxModel.suffixIcon,
                            color: Colors.grey),
                        onPressed: simpleTextBoxModel.onSuffixIconButtonClicked)
                    : null,
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: simpleTextBoxModel.hintText,
                fillColor: Colors.white70),
          );
        },
      ),
    );
  }
}
