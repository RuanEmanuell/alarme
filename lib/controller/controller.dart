import 'package:flutter/material.dart';

class Controller extends ChangeNotifier{
  int _hour=0;
  int _minute=0;
  final _alarm=[];

  int get hour=>_hour;
  int get minute=>_minute;
  get alarm=>_alarm;

  incNumber(){
    _hour++;
    _minute++;
    _alarm.add(_hour);
    notifyListeners();
  }
}