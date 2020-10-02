import 'package:everest/Services/Application/debouncer.dart';
import 'package:everest/Widgets/Models/search_box_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/// Simple textbox model
/// @author Manish Poudel
/// @createdAt 9/25/2020
class SearchBoxFilterModel extends ChangeNotifier {
  bool filterUsernameActive = false;
  bool filterNameActive = false;
  SearchBoxModel _searchBoxModel;

  SearchBoxFilterModel(this._searchBoxModel);

  onFilterUsernameChanged()
  {
    filterUsernameActive = !filterUsernameActive;
    _searchBoxModel.notifyOnChangeInFilter();
    notifyListeners();
  }

  onFilterNameChanged()
  {
    filterNameActive = !filterNameActive;
    _searchBoxModel.notifyOnChangeInFilter();
    notifyListeners();
  }
}
