
import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Utilities/view_utility.dart';
import 'package:everest/Views/image_viewer.dart';
import 'package:everest/Widgets/Models/Post/post_image_and_note_entry_model.dart';
import 'package:everest/Widgets/multiline_textbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PostImageAndNoteEntryWidget extends StatefulWidget {
  @override
  _PostImageAndNoteEntryWidgetState createState() =>
      _PostImageAndNoteEntryWidgetState();
}

class _PostImageAndNoteEntryWidgetState
    extends State<PostImageAndNoteEntryWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    return Consumer<PostImageAndNoteEntryModel>(
        builder: (context, model, child) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Note",
                  style: TextStyle(
                      fontFamily: appConfig.fontFamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey,
                      fontSize:
                          ScreenUtility.getStandardPadding(context) * 2),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.image,
                            color: Colors.grey,
                            size:
                                ScreenUtility.getScreenWidth(context) * 0.04),
                        onPressed: () => model.getImage(ImageSource.gallery)),
                    IconButton(
                        icon: Icon(Icons.camera_alt,
                            color: Colors.grey,
                            size:
                                ScreenUtility.getScreenWidth(context) * 0.04),
                        onPressed: () => model.getImage(ImageSource.camera)),
                  ],
                )
              ],
            ),
            ChangeNotifierProvider.value(
                value: model.multiLineTextBoxModel, child: Container(
                child: MultiLineTextBox())),
            model.image != null
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () => ViewUtility.cupertinoPush(
                            model.parentContext,
                            ImageViewer(FileImage(model.image))),
                        child: Image.file(
                          model.image,
                          height: ScreenUtility.getScreenHeight(context) * 0.4,
                          width: ScreenUtility.getScreenWidth(context),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            ScreenUtility.getStandardPadding(context)),
                        child: ClipOval(
                          child: Material(
                            elevation: 2,
                            color: Colors.black54,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.clear,
                                  size: ScreenUtility.getScreenWidth(context) *
                                      0.032,
                                  color: Colors.white,
                                ),
                                onPressed: () => model.removeImage()),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(height: 0, width: 0),

          ],
        ),
      );
    });
  }
}
