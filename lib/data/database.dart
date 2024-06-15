import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List todoList =[];
  // refrence box
  final _mybox = Hive.box('mybox');
  //run this method if first time ever opening app
  void createInitialData(){
    todoList =[
      ["Learn Flutter",false],
      ["Do Exercise", false],
    ];
  }
  // load the data from database
  void loadData(){
    todoList = _mybox.get("TodoList");
  }

  // update the database
  void updateDatabase(){
    _mybox.put("TodoList", todoList);
  }
}