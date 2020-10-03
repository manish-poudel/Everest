import 'package:everest/Widgets/Models/drop_down_menu_model.dart';
import 'package:flutter/cupertino.dart';

class PostActivityEntryModel extends ChangeNotifier {
  DropDownMenuModel activityDropDownModel = DropDownMenuModel(selectedValue: "Work" , values:["Work","Study"]);
  DropDownMenuModel activityWithDropDownModel = DropDownMenuModel(selectedValue: "Coworkers" , values:["Coworkers","Family", "Friend"]);
}