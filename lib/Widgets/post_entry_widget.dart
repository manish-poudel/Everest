import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/multiline_textbox_model.dart';
import 'package:everest/Widgets/multiline_textbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostEntryWidget extends StatefulWidget {
  @override
  _PostEntryWidgetState createState() => _PostEntryWidgetState();
}

class _PostEntryWidgetState extends State<PostEntryWidget> {

  User _user;
  AppConfig _appConfig;
  String privacyOptions = "Public";
  MultiLineTextBoxModel _multiLineTextBoxModel;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _multiLineTextBoxModel = MultiLineTextBoxModel(
        height: ScreenUtility.getScreenHeight(context) * 0.5,
        hintText: "What are you planning to do?",validator:(val)
    {
    return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<User>(context, listen: false);
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _top(),
        ChangeNotifierProvider.value(value: _multiLineTextBoxModel,child: MultiLineTextBox(),)
      ],
    );
  }

  /// Top widget
  /// @returns Widget
  Widget _top()
  {
    return Row(
      children: [
        CircleAvatar(
          radius: ScreenUtility.getScreenWidth(context) *0.032,
          backgroundImage:
          _user.profileImageUrl.isEmpty?AssetImage(ImageResources.userPlaceholderImgPath):NetworkImage(_user.profileImageUrl),
          backgroundColor: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenUtility.getStandardPadding(context) * 2, top: ScreenUtility.getStandardPadding(context) * 1.2),
          child: Column(
            children: [
              Text(_user.name, style: TextStyle(fontFamily: _appConfig.fontFamily, fontWeight: FontWeight.bold)),
              Container(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: privacyOptions,
                    items: <String>['Public', 'Private']
                        .map<DropdownMenuItem<String>>((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.only(left: ScreenUtility.getStandardPadding(context)),
                          child: Row(
                            children: [
                              Icon(value == "Public"?Icons.public:Icons.group, size: ScreenUtility.getScreenWidth(context) * 0.02,),
                              Padding(
                                padding: EdgeInsets.only(left:ScreenUtility.getStandardPadding(context)),
                                child: new Text(value,
                                    style: TextStyle(
                                        fontFamily: _appConfig.fontFamily,
                                        fontSize:
                                        ScreenUtility.getStandardSize8(context) * 2)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        privacyOptions = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
