
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
        children: [
        SlidableAction(onPressed: deleteFunction,
        icon: Icons.delete,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(8),)
          
        ],),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black)
              ,Text(taskName,style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough :  TextDecoration.none),),
            ],
          ),
          decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
//commits check
//check another commit
// check another commit
//check another commit
