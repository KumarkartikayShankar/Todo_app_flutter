import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app/home_page.dart';

void main() async{
// initialize hive
  await Hive.initFlutter();


  //open box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
    primarySwatch: Colors.yellow,
    appBarTheme:  AppBarTheme(
        backgroundColor: Colors.yellow, // Or any desired color
    ),
),

    );
  }
 
}
