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
    AppConfig appConfig = Provider.of<AppConfig>(context,listen: false);
    return Consumer<PostActivityEntryModel>(
      builder: (context, model, child){
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: ScreenUtility.getStandardPadding(context) * 5),
              child: Text("So, whats your next activity?",style: TextStyle(
                fontSize: ScreenUtility.getStandardSize8(context) * 2,
                  fontWeight: FontWeight.w500,
                  fontFamily: appConfig.fontFamily, color: appConfig.appTheme.primaryColor)),
            ),
            Container(

                child: SizedBox(
                    width: ScreenUtility.getScreenWidth(context),
                    child: ChangeNotifierProvider.value(value: model.activityDropDownModel, child: DropDownMenu()))),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtility.getStandardPadding(context) * 3 ),
              child: Text("Mind telling with whom?",style: TextStyle(
                  fontSize: ScreenUtility.getStandardSize8(context) * 2,
                  fontWeight: FontWeight.w500,
                  fontFamily: appConfig.fontFamily, color: appConfig.appTheme.primaryColor)),
            ),
            Container(
                // decoration: ShapeDecoration(
                //   shape: RoundedRectangleBorder(
                //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
                //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //   ),
                // ),
                child: SizedBox(
                    width: ScreenUtility.getScreenWidth(context),
                    child: ChangeNotifierProvider.value(value: model.activityWithDropDownModel, child: DropDownMenu())))
          ],
        );
      }
    );
  }
}
