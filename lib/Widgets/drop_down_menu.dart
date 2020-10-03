import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/drop_down_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    return Consumer<DropDownMenuModel>(
      builder: (context, model, child){
        return DropdownButton<String>(
          isExpanded: true,
            value: model.selectedValue,
            items: model.values
                .map<DropdownMenuItem<String>>((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.only(left: ScreenUtility.getStandardPadding(context)),
                  child: Text(value,
                      style: TextStyle(
                          fontFamily: appConfig.fontFamily,
                          fontSize:
                          ScreenUtility.getStandardSize8(context) * 2)),
                ),
              );
            }).toList(),
            onChanged: (value) => model.changeValue(value)
        );
      }
    );
  }
}
