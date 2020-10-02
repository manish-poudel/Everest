import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/// Handles communication with google firebase cloud function
/// @createdAt 9/30/2020
/// @author Manish Poudel
class FirebaseCloudFunctionService {
  String _basePath;
  FirebaseCloudFunctionService({@required String basePath}) {
    this._basePath = basePath;
  }

  /// Call firebase cloud functions using get request
  /// @param sub directory path and header w
  /// @returns map responses
   get(
      {@required String subDirectory}) async {
    print(_basePath + subDirectory);
    var response = await http.get(_basePath + subDirectory);
    if (response.statusCode == 200) {
      var jsonResponse =  convert.jsonDecode(response.body);
     return jsonResponse;
    }
  }
}
