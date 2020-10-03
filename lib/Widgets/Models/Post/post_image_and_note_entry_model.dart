import 'dart:io';

import 'package:everest/Widgets/Models/multiline_textbox_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PostImageAndNoteEntryModel extends ChangeNotifier {

  BuildContext parentContext;
  MultiLineTextBoxModel multiLineTextBoxModel = MultiLineTextBoxModel(
      hintText: "",
      validator: (text) {
        return "good";
      });

  PostImageAndNoteEntryModel(this.parentContext);
  File image;
  final picker = ImagePicker();

  /// Get image
  getImage(ImageSource source)
  async {
    final pickedFile = await picker.getImage(source: source);
    if(pickedFile != null)
      {
        image = File(pickedFile.path);
        notifyListeners();
      }
  }

  /// Remove image
  removeImage()
  {
    image = null;
    notifyListeners();
  }
}
