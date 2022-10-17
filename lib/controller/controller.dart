import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  TimeOfDay time = TimeOfDay.now();
  String name = "Alarm";

  final _hour = [];
  final _minute = [];
  final _alarmName = [];

  get hour => _hour;
  get minute => _minute;
  get alarmName => _alarmName;

  incNumber() {
    _hour.add(time.hour);
    _minute.add(time.minute);
    _alarmName.add(name);
    notifyListeners();
  }
}
