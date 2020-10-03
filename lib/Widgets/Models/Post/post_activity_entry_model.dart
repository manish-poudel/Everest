import 'package:everest/Widgets/Models/drop_down_menu_model.dart';
import 'package:flutter/cupertino.dart';

class PostActivityEntryModel extends ChangeNotifier {
  DropDownMenuModel activityDropDownModel = DropDownMenuModel(selectedValue: "Work" , values:["Work","Study", "Entertainment", "Exercise","Cook", "Personal", "Self-Improvement","Others"]);
  DropDownMenuModel activityWithDropDownModel = DropDownMenuModel(selectedValue: "Just me" , values:["Just me","Coworkers","Family", "Friend(s)", "Guru", "Tutor", "Others","Prefer not to say"]);
  DropDownMenuModel timeDropDownModel = DropDownMenuModel(selectedValue: "I don't know" , values:["I don't know", "By 30 minutes","By 1 hour", "More than 1 hour"]);
}