import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/search_box_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBoxFilter extends StatefulWidget {
  @override
  _SearchBoxFilterState createState() => _SearchBoxFilterState();
}

class _SearchBoxFilterState extends State<SearchBoxFilter> {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    SearchBoxFilterModel searchBoxFilterModel = Provider.of<SearchBoxFilterModel>(context, listen: true);

    return Container(
      padding: EdgeInsets.all(ScreenUtility.getStandardSize8(context)),
      color:Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(left:ScreenUtility.getStandardSize8(context)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: FlatButton(
                color: searchBoxFilterModel.searchByUsername?Colors.grey[200]:Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtility.getStandardSize8(context) * 3),
                    side: BorderSide(color: Colors.grey[200])
                ),
                child: Text("username",style: TextStyle(
                    fontSize: ScreenUtility.getStandardSize8(context) * 1.6,
                    fontFamily: appConfig.fontFamily)),
                onPressed: () => searchBoxFilterModel.onSearchByChanged(),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:ScreenUtility.getStandardSize8(context)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: FlatButton(
                color: !searchBoxFilterModel.searchByUsername?Colors.grey[200]:Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtility.getStandardSize8(context) * 3),
                    side: BorderSide(color: Colors.grey[200])
                ),
                child: Text("name",style: TextStyle(
                  fontSize: ScreenUtility.getStandardSize8(context) * 1.6,
                    fontFamily: appConfig.fontFamily)),
                onPressed: ()=>  searchBoxFilterModel.onSearchByChanged(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
