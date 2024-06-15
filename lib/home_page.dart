import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';
class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() {
    
    return _HomepageState();
  }
  
}
class _HomepageState extends State<Homepage>{

  //refrence hive box
  final _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {
    super.initState();
    // first time ever of app
    if(_mybox.get("TodoList")==null){
      db.createInitialData();
    }else{
      db.loadData();
  }

  } 
  // text controller
  final _controller = TextEditingController();

 

// check box tapped
void checkBoxChanged(bool? value , int index){
  setState(() {
    db.todoList[index][1] =  !db.todoList[index][1];
  });
  db.updateDatabase();

}


//save new task
void saveNewTask(){
  setState(() {
    db.todoList.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDatabase();
}
// create new task
void createNewTask(){
  showDialog(context: context, builder: (context){
    return DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancle: () => Navigator.of(context).pop(),
    );
  });
}

void deleteTask (int index,){
  setState(() {
    db.todoList.removeAt(index);
  });
  db.updateDatabase();
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TO DO',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: const Icon(Icons.add),
      backgroundColor: Colors.yellow,),
      body: ListView.builder(
       itemCount: db.todoList.length,
       itemBuilder: (context, index) {
        return ToDoTile(taskName: db.todoList[index][0], taskCompleted: db.todoList[index][1], onChanged: (value) =>checkBoxChanged(value,index),deleteFunction: (context) => deleteTask(index),);
       } ,
      ),
    );
  }
}