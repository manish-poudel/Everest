import 'package:everest/Utilities/screen_utility.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {

  final ImageProvider image;

  ImageViewer(this.image);
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
       child: Stack(
         alignment: Alignment.topLeft,
         children: [
           PhotoView(
             imageProvider: widget.image,
           ),
           Padding(
             padding: EdgeInsets.only(top:ScreenUtility.getStatusBarHeight(context) * 1),
             child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: ScreenUtility.getScreenWidth(context) * 0.05), onPressed: () => Navigator.of(context).pop()),
           ),
         ],
       ),
      ),
    );
  }
}
