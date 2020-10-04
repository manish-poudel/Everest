import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/search_box_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    SearchBoxModel searchBoxModel = Provider.of<SearchBoxModel>(context, listen: false);
    return  Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: ScreenUtility.getScreenHeight(context) * 0.08,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          size: ScreenUtility.getScreenHeight(context) * 0.032),
                      onPressed: () {
                        Navigator.of(searchBoxModel.context).pop();
                      })),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtility.getStandardPadding(context) * 2),
                  child: TextFormField(
                    style:TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtility.getStandardSize8(context) * 2,
                        fontFamily: appConfig.fontFamily),
                    controller: searchBoxModel.textEditingController,
                    autofocus: true,
                    onChanged: (text) =>  searchBoxModel.onTextChange(text),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search by username, name or email id',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtility.getStandardSize8(context) * 1.5,
                            fontFamily: appConfig.fontFamily)),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  /// Search box widget

}


