import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/simple_textbox_model.dart';
import 'package:everest/Widgets/rounded_flat_buttons.dart';
import 'package:everest/Widgets/simple_textbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Class that provides widget for profile entry
/// @author Manish Poudel
/// @createdAt 9/26/2020
class ProfileEntryWidget extends StatefulWidget {
  final String Function(String) firstNameValidator;
  final String Function(String) usernameValidator;
  final Function onProfileSave;

  ProfileEntryWidget(
      {@required this.firstNameValidator,
      @required this.usernameValidator,
      @required this.onProfileSave});

  @override
  _ProfileEntryWidgetState createState() => _ProfileEntryWidgetState();
}

class _ProfileEntryWidgetState extends State<ProfileEntryWidget> {
  final _formKey = GlobalKey<FormState>();
  SimpleTextBoxModel _firstNameTextBoxModel;
  SimpleTextBoxModel _lastNameTextBoxModel;
  String _genderSelect = "Male";
  double _standardPadding;
  AppConfig _appConfig;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _standardPadding = ScreenUtility.getStandardPadding(context);
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    _firstNameTextBoxModel = SimpleTextBoxModel(
        hintText: "Name", validator: widget.firstNameValidator);
    _lastNameTextBoxModel = SimpleTextBoxModel(
        hintText: "Username", validator: widget.usernameValidator);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Basic profile setup",
            style: TextStyle(
                fontSize: ScreenUtility.getStandardSize8(context) * 3,
                fontFamily: _appConfig.fontFamily,
                fontWeight: FontWeight.w600),
          ),
          Text("let's get to know you a little bit and we are done.",
              style: TextStyle(
                  fontSize: ScreenUtility.getStandardSize8(context) * 1.5,
                  fontFamily: _appConfig.fontFamily,
                  fontWeight: FontWeight.w300)),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _firstNameTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding),
            child: ChangeNotifierProvider<SimpleTextBoxModel>(
                create: (context) => _lastNameTextBoxModel,
                child: SimpleTextBoxWidget()),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding * 2),
            child: Container(
              width: ScreenUtility.getScreenWidth(context),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _genderSelect,
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.only(left: _standardPadding),
                      child: new Text(value,
                          style: TextStyle(
                              fontFamily: _appConfig.fontFamily,
                              fontSize:
                                  ScreenUtility.getStandardSize8(context) * 2)),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _genderSelect = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _standardPadding * 3),
            child: RoundedFlatButton(
              onClick: () {
                if (_formKey.currentState.validate()) {
                  Function.apply(widget.onProfileSave, [
                    _firstNameTextBoxModel.textEditingController.text.trim(),
                    _lastNameTextBoxModel.textEditingController.text.trim(),
                    _genderSelect.trim()
                  ]);
                }
              },
              width: ScreenUtility.getScreenWidth(context),
              text: "Save",
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
