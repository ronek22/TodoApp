import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: todoListItems(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: "Add new Todo",
          child: new Icon(
            Icons.add,
            size: 35.0,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  ListView todoListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 20.0,
                    spreadRadius: -15.0,
                    offset: Offset(0.0, 4.0)),
              ]),
              child: Card(
                  color: Colors.white,
                  // elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.blue,
                        child: Text(this.todos[position].id.toString()),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          this.todos[position].title,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Text(
                        this.todos[position].date,
                        style: TextStyle(
                            fontSize: 11.0, fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        debugPrint(
                            "Tapped on " + this.todos[position].id.toString());
                      },
                    ),
                  )),
            ),
          );
        });
  }

  void getData() {
    final dbFuture = helper.initalizeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items: " + count.toString());
      });
    });
  }
}
