import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/Post/post_activity_entry_model.dart';
import 'package:everest/Widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostActivityEntryWidget extends StatefulWidget {
  @override
  _PostActivityEntryWidgetState createState() => _PostActivityEntryWidgetState();
}

class _PostActivityEntryWidgetState extends State<PostActivityEntryWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostActivityEntryModel>(
      builder: (context, model, child){
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconText("So, what's your next activity?"),
            Container(
                child: SizedBox(
                    width: ScreenUtility.getScreenWidth(context),
                    child: ChangeNotifierProvider.value(value: model.activityDropDownModel, child: DropDownMenu()))),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtility.getStandardPadding(context) * 3 ),
              child: iconText("Mind telling with whom?"),),
            Container(
                child: SizedBox(
                    width: ScreenUtility.getScreenWidth(context),
                    child: ChangeNotifierProvider.value(value: model.activityWithDropDownModel, child: DropDownMenu()))),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtility.getStandardPadding(context) * 3 ),
              child:iconText("When do you think it will get over?"),
            ),
            Container(
                child: SizedBox(
                    width: ScreenUtility.getScreenWidth(context),
                    child: ChangeNotifierProvider.value(value: model.timeDropDownModel, child: DropDownMenu())))
          ],
        );
      }
    );
  }

  Widget iconText(String text)
  {
    AppConfig appConfig = Provider.of<AppConfig>(context,listen: false);
    return Padding(
      padding:  EdgeInsets.only(left: ScreenUtility.getStandardSize8(context)),
      child: Text(text,style: TextStyle(
          fontSize: ScreenUtility.getStandardSize8(context) * 1.8,
          fontWeight: FontWeight.w400,
          fontFamily: appConfig.fontFamily, color: appConfig.appTheme.primaryColor)),
    );
  }
}
