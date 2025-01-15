
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // variable
  //reference our box
  final _myBox = Hive.box('mybox');

  //methods
  // write data
  void writeData() {
    _myBox.put(1, 'Mitch');
  }

  // read data 
  void readData() {
    print(_myBox.get(1));
  }
  // delete data
  void deleteData() {
    _myBox.delete(1);
  }
  //UI



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("hi"),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: writeData,
              child: Text('Write'),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: readData,
              child: Text('Read'),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: deleteData,
              child: Text('Delete'),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
