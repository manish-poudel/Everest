import 'package:flutter/cupertino.dart';

class DropDownMenuModel extends ChangeNotifier
{
  String selectedValue;
  List<String> values;

  DropDownMenuModel({@required this.selectedValue, @required this.values});

  changeValue(String value)
  {
    selectedValue = value;
    notifyListeners();
  }
}