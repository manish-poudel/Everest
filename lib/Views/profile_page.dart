import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppConfig _appConfig;
  @override
  Widget build(BuildContext context) {
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    return Column(
      children: [
        _buildUserInfo(context: context),
      ],
    );
  }

  /// User info widget
  /// @param context
  /// @returns Widget containing profile info
  Widget _buildUserInfo({BuildContext context}) {
    final user = Provider.of<User>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        user.userProfileUrl.isEmpty || user.userProfileUrl == null
            ? Icon(Icons.account_circle,
                color: Colors.grey[300],
                size: ScreenUtility.getScreenHeight(context) * 0.2)
            : Container(
                width: ScreenUtility.getScreenHeight(context) * 0.2,
                height: ScreenUtility.getScreenHeight(context) * 0.2,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(
                            ImageResources.userPlaceholderImgPath)))),
        Text(user.firstName + " " + user.lastName,
            style: TextStyle(
                fontFamily: _appConfig.fontFamily,
                fontWeight: FontWeight.w500)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.brightness_1,
              color: Colors.green,
              size: 8,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtility.getStandardPadding(context)),
              child: Text("Available",
                  style: TextStyle(
                      fontFamily: _appConfig.fontFamily,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ],
    );
  }
}
