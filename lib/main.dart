import 'package:flutter/material.dart';
import 'package:todo_app/ui/simple_app_bar.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todolist.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: new MyHomePage(title: 'Todos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(255,213,222,217),
      body: 
      Column(
        children: <Widget>[
          SimpleAppBar(widget.title),
          Expanded(child: TodoList()),
        ],
      ), 
    );
  }
}
