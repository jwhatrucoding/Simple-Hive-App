import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter_tutorial/pages/home_page.dart';

void main() async {
  // intialize hive
  await Hive.initFlutter();

  // open the box (box is a representation of a database)
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // deactivate debug banner 
      debugShowCheckedModeBanner: false,
      // makes white screen
      home: HomePage(),
    );
  }
}