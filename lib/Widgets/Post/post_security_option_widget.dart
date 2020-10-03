import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/Post/post_security_option_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostSecurityOptionWidget extends StatefulWidget {
  @override
  _PostSecurityOptionWidgetState createState() => _PostSecurityOptionWidgetState();
}

class _PostSecurityOptionWidgetState extends State<PostSecurityOptionWidget> {
  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<User>(context, listen: false);
   var _appConfig = Provider.of<AppConfig>(context, listen: false);
    return  Row(
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
                child: Consumer<PostSecurityOptionModel>(
                  builder: (context, model, child){
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: model.securityOptionSelected,
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
                        onChanged: (value) => model.changeSecurityOption(value)
                      ),
                    );
                  },
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}
