import 'package:everest/Widgets/Models/Post/post_activity_entry_model.dart';
import 'package:everest/Widgets/Models/Post/post_entry_model.dart';
import 'package:everest/Widgets/Models/Post/post_entry_view_enum.dart';
import 'package:everest/Widgets/Models/Post/post_image_and_note_entry_model.dart';
import 'package:everest/Widgets/Models/multiline_textbox_model.dart';
import 'package:everest/Widgets/Post/post_activity_entry_widget.dart';
import 'package:everest/Widgets/Post/post_image_and_note_entry_widget.dart';
import 'package:everest/Widgets/Post/post_status_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostEntryMainWidget extends StatefulWidget {
  @override
  _PostEntryMainWidgetState createState() => _PostEntryMainWidgetState();
}

class _PostEntryMainWidgetState extends State<PostEntryMainWidget> {

  PostImageAndNoteEntryModel _postImageAndNoteEntryModel;
  PostActivityEntryModel _postActivityEntryModel;
  @override
  void initState() {
    super.initState();
    _postImageAndNoteEntryModel = PostImageAndNoteEntryModel();
    _postActivityEntryModel = PostActivityEntryModel();

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PostEntryMainModel>(builder: (context, model, child) {
      if (model.postEntryView == PostEntryView.activity) {
        return  ChangeNotifierProvider.value(value: _postActivityEntryModel,
          child: PostActivityEntryWidget(),
        );
      }

      if (model.postEntryView == PostEntryView.imageAndNote) {
        return ChangeNotifierProvider.value(value: _postImageAndNoteEntryModel,
          child: PostImageAndNoteEntryWidget(),
        );
      }

      if (model.postEntryView == PostEntryView.changeStatus) {
       return PostStatusEntryWidget();
      }
      return Container(child: Text("Sorry! something went wrong."));
    });
  }
}
