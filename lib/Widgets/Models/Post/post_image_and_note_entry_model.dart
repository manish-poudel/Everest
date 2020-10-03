import 'package:everest/Widgets/Models/multiline_textbox_model.dart';
import 'package:flutter/cupertino.dart';

class PostImageAndNoteEntryModel extends ChangeNotifier {
  MultiLineTextBoxModel multiLineTextBoxModel = MultiLineTextBoxModel(
      hintText: "Leave some note",
      validator: (text) {
        return "good";
      });
}
