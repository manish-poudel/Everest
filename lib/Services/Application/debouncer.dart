import 'dart:async';

import 'package:flutter/cupertino.dart';

/// Debouncer class to handle timely operations
/// @createdAt 9/29/2020
/// @author Manish Poudel
class Debouncer {
  final int milliSeconds;
  VoidCallback actions;
  Timer _timer;

  Debouncer({@required this.milliSeconds}) : assert(milliSeconds != null);

  /// Run timely operations
  /// @param void call back function
  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliSeconds), action);
  }

  dispose()
  {
    _timer.cancel();
  }
}
