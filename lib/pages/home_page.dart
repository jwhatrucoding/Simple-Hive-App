
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
  final TextEditingController textControllerValue = TextEditingController();
  final TextEditingController textControllerIndex = TextEditingController();

  //methods
  // write data
  void writeData() {
    _myBox.put(textControllerIndex.text, textControllerValue.text);
    print(_myBox.get(1));
  }

  // read data 
  void readData() {
    print("In this version, you are able to see the content displayed in the ListView! :)");
  }
  // delete data
  void deleteData() {
    _myBox.clear();
  }

  // listview
  Widget _buildListView() {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: _myBox.listenable(),
        builder: (context, Box box, _) {
          return ListView.builder(
            itemCount: box.keys.length,
            itemBuilder: (context, index) {
              final key = box.keys.toList()[index];
              final value = box.get(key);
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add spacing around each item
                decoration: BoxDecoration(
                  color: Colors.white, // Background color for each item
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: ListTile(
                  title: Text(
                    value.toString(),
                    style: TextStyle(fontSize: 16), // Customize text style if needed
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
  //UI
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Local Database"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textControllerValue,
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),
            TextField(
              controller: textControllerIndex,
              decoration: InputDecoration(
                labelText: 'Enter index',
                border: OutlineInputBorder(),
              ),
            ),
            _buildListView(), // Call the separate method here
            SizedBox(height: 20), // Add spacing between TextField and buttons
            Row(
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
          ],
        ),
      ),
    );
  }
}

