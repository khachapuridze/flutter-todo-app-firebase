import 'package:flutter/material.dart';
import 'package:flutter_learning/data/models/todo.dart';
import 'package:flutter_learning/data/repositories/todo_repository.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);
  final TextEditingController _todoTitleEditController =
      TextEditingController();
  final TextEditingController _todoDescriptionEditController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ეს id ძალიან ცუდად ჩანს
    // todo make dynamic id value of todo
    var todo = Todo(
        id: "1",
        title: _todoTitleEditController.text,
        description: _todoDescriptionEditController.text,
        isDone: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    labelText: 'User',
                    hintText: "enter user name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white, width: 3.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  controller: _todoTitleEditController,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    labelText: 'Description',
                    hintText: "enter todo description",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white, width: 3.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  controller: _todoDescriptionEditController,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextButton(
                  onPressed: () => {
                    Provider.of<TodoRepository>(context, listen: false)
                        .add(todo),
                    Navigator.of(context).pushNamed('/home')
                  },
                  child: Text("Add Todo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
