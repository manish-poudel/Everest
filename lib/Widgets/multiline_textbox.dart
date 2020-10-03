import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/multiline_textbox_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Class that provides textbox
/// @author Manish Poudel
/// @createdAt 9/24/2020

class MultiLineTextBox extends StatefulWidget {
  MultiLineTextBox();

  @override
  _MultiLineTextBoxState createState() => _MultiLineTextBoxState();
}

class _MultiLineTextBoxState extends State<MultiLineTextBox> {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    return Theme(
      data: new ThemeData(
        primaryColor: appConfig.appTheme.primaryColor,
        hintColor: Colors.grey,
      ),
      child: Consumer<MultiLineTextBoxModel>(
        builder: (context, multiLineTextBoxModel, child) {
          return TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: multiLineTextBoxModel.maxLines,
            validator: multiLineTextBoxModel.validator,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtility.getStandardSize8(context) * 2,
                fontFamily: appConfig.fontFamily),
            autofocus: true,
            controller: multiLineTextBoxModel.textEditingController,
            decoration: new InputDecoration(
              border: InputBorder.none,
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: multiLineTextBoxModel.hintText,
                fillColor: Colors.white),
          );
        },
      ),
    );
  }
}
