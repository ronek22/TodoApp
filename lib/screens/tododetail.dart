import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:intl/intl.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State {
  Todo todo;
  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TodoDetailState(this.todo);

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
    );

    // Theme.of(context).textTheme.title;
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              "Add the plan",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Text(
                "Fill the form below, plan something creative and worth doing. ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 15.0,
                      spreadRadius: -5.0,
                      offset: Offset(0.0, 7.0)),
                ],
              ),
              width: 320.0,
              height: 370.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomInput(controller: titleController, hintText: 'Title', textStyle: textStyle),
                    SizedBox(height: 10.0,),
                    CustomInput(controller: descriptionController, hintText: 'Specific content', textStyle: textStyle),
                    SizedBox(height: 10.0,),
                    PriorityDropDown(priorities: _priorities, textStyle: textStyle),
                    SizedBox(height: 50.0,),

                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(13.0),
                      elevation: 2.0,
                      textColor: Colors.white,
                      color: Colors.amber,
                      onPressed: () {},
                      child: Text("Add",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Click Floated Back.");
            Navigator.pop(context);
          },
          elevation: 5.0,
          backgroundColor: Colors.indigoAccent[700],
          tooltip: "Cancel",
          child: new Icon(
            Icons.clear,
            size: 35.0,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key key,
    @required this.controller,
    @required this.textStyle,
    @required this.hintText
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: textStyle,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          labelStyle: textStyle,
        ));
  }
}

class PriorityDropDown extends StatelessWidget {
  const PriorityDropDown({
    Key key,
    @required List<String> priorities,
    @required this.textStyle,
  }) : _priorities = priorities, super(key: key);

  final List<String> _priorities;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Priority',
        contentPadding: EdgeInsets.zero,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: _priorities.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          style: textStyle,
          value: "Low",
          onChanged: null,
        ),
      ),
    );
  }
}
