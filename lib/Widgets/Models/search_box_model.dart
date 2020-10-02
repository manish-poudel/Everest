import 'package:everest/Services/Application/debouncer.dart';
import 'package:flutter/cupertino.dart';

/// Simple textbox model
/// @author Manish Poudel
/// @createdAt 9/25/2020
class SearchBoxModel extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  final _debouncer = Debouncer(milliSeconds: 1000);
  final BuildContext context;
  String searchText = "";


  SearchBoxModel({@required this.context});
  /// Calls every time text is changed in text box
  /// @param text received from widget
  onTextChange(String text) {
    _debouncer.run(() {
      searchText = text;
      notifyListeners();
    });/// Run every 500 milliseconds
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer.dispose();
  }

  /// Notify change in filter
  notifyOnChangeInFilter()
  {
    notifyListeners();
  }
}
