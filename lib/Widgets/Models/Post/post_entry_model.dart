import 'package:everest/Widgets/Models/Post/post_activity_entry_model.dart';
import 'package:everest/Widgets/Models/Post/post_entry_view_enum.dart';
import 'package:everest/Widgets/Models/Post/post_image_and_note_entry_model.dart';
import 'package:flutter/cupertino.dart';

/// Post entry model
/// @author Manish Poudel
/// @since 10/3/2020
class PostEntryMainModel extends ChangeNotifier{

  PostEntryView postEntryView = PostEntryView.activity;
  PostImageAndNoteEntryModel postImageAndNoteEntryModel;
  PostActivityEntryModel postActivityEntryModel;
  BuildContext context;

  PostEntryMainModel(this.context){
    postImageAndNoteEntryModel = PostImageAndNoteEntryModel(context);
   postActivityEntryModel = PostActivityEntryModel();
  }

  /// Go to next view
  changeView(PostEntryView postEntryView)
  {
    this.postEntryView = postEntryView;
    notifyListeners();
  }
}