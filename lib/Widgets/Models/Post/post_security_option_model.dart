import 'package:flutter/cupertino.dart';

/// Post header model
/// @author Manish Poudel
/// @since 10/3/2020
class PostSecurityOptionModel extends ChangeNotifier{

  String securityOptionSelected = "Public";

  /// On new security option selected
  changeSecurityOption(String option)
  {
    this.securityOptionSelected = option;
    notifyListeners();
  }

}