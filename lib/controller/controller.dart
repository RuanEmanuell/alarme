import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {

  var removeIndex;

  Controller({
     this.removeIndex
  });

  String todoName = "Todo";
  bool checkedTodo=false;

  var _todos = [];

  get todos => _todos;

  incNumber() {
    todos.add(todoName);
    notifyListeners();
  }

  checkTodo(){
    checkedTodo=!checkedTodo;
    notifyListeners();
  }

  removeTodo(index){
    todos.removeAt(removeIndex);
    notifyListeners();
  }
}
