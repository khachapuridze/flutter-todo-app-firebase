
import 'package:flutter/material.dart';
import 'package:flutter_learning/presentation/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test app'),
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.of(context).pushNamed('/add-todo')},
        child: Icon(Icons.add),
      ),
    );
  }
}
