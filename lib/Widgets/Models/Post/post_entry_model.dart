import 'package:everest/Widgets/Models/Post/post_entry_view_enum.dart';
import 'package:flutter/cupertino.dart';

/// Post entry model
/// @author Manish Poudel
/// @since 10/3/2020
class PostEntryMainModel extends ChangeNotifier{

  PostEntryView postEntryView = PostEntryView.activity;
  BuildContext context;
  PostEntryMainModel(this.context);

  /// Go to next view
  changeView(PostEntryView postEntryView)
  {
    this.postEntryView = postEntryView;
    notifyListeners();
  }
}