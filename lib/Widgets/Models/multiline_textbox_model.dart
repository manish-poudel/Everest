import 'package:flutter/cupertino.dart';

/// Simple textbox model
/// @author Manish Poudel
/// @createdAt 9/25/2020
class MultiLineTextBoxModel extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  String hintText;
  Function validator;
  int maxLines;
  double height;

  MultiLineTextBoxModel(
      {this.hintText,
        this.maxLines,
        this.height,
        this.validator,
});

}
