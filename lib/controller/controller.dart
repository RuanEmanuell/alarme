import 'package:flutter/material.dart';

import "../screens/create.dart";

class Controller extends ChangeNotifier{
  TimeOfDay time=TimeOfDay.now();
  var _hour=[];
  var _minute=[];

  get hour=>_hour;
  get minute=>_minute;

  incNumber(){
    _hour.add(time.hour);
    _minute.add(time.minute);
    notifyListeners();
  }
}