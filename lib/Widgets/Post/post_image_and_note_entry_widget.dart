import 'package:everest/Widgets/Models/Post/post_image_and_note_entry_model.dart';
import 'package:everest/Widgets/Models/multiline_textbox_model.dart';
import 'package:everest/Widgets/multiline_textbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostImageAndNoteEntryWidget extends StatefulWidget {
  @override
  _PostImageAndNoteEntryWidgetState createState() => _PostImageAndNoteEntryWidgetState();
}

class _PostImageAndNoteEntryWidgetState extends State<PostImageAndNoteEntryWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<PostImageAndNoteEntryModel>(
        builder: (context, model, child){
           return  ChangeNotifierProvider.value(value: model.multiLineTextBoxModel, child: MultiLineTextBox());
        }
    ));
  }
}
