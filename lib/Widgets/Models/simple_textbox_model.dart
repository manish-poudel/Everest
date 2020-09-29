import 'package:flutter/cupertino.dart';

/// Simple textbox model
/// @author Manish Poudel
/// @createdAt 9/25/2020
class SimpleTextBoxModel extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  bool obscureText;
  String hintText;
  IconData suffixIcon;
  Function onSuffixIconButtonPressed;
  Function validator;

  SimpleTextBoxModel(
      {this.obscureText,
      @required this.hintText,
      this.validator,
      this.suffixIcon,
      this.onSuffixIconButtonPressed});

  /// On suffix icon button clicked
  onSuffixIconButtonClicked() {
    Function.apply(onSuffixIconButtonPressed, []);
    notifyListeners();
  }
}
