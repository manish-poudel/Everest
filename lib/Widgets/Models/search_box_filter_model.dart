import 'package:everest/Widgets/Models/search_box_model.dart';
import 'package:flutter/cupertino.dart';

/// Simple textbox model
/// @author Manish Poudel
/// @createdAt 9/25/2020
class SearchBoxFilterModel extends ChangeNotifier {
  bool searchByUsername = true;
  SearchBoxModel _searchBoxModel;

  SearchBoxFilterModel(this._searchBoxModel);

  onSearchByChanged()
  {
   searchByUsername = !searchByUsername;
   _searchBoxModel.notifyOnChangeInFilter();
    notifyListeners();
  }
}
