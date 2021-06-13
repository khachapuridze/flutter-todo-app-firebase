import 'package:flutter/material.dart';
import 'package:flutter_learning/data/repositories/todo_repository.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(dataId) async {
      return await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure ?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Would you like to delete ?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Provider.of<TodoRepository>(context, listen: false)
                      .delete(dataId);
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Consumer<TodoRepository>(
      builder: (context, todoModel, child) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: todoModel.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: todoModel.todos[index].isDone,
                      onChanged: (bool? isDone) => {
                        todoModel.toggleDone(todoModel.todos[index].id!),
                      },
                    ),
                    Text(todoModel.todos[index].title!),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => {
                        Navigator.of(context)
                            .pushNamed('/edit-todo', arguments: {
                          todoModel.todos[index].title,
                          todoModel.todos[index].description,
                          todoModel.todos[index].id,
                          todoModel.todos[index].isDone,
                        })
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => {
                        _showMyDialog(
                          todoModel.todos[index].id,
                        )
                      },
                    ),
                  ]),
            );
          }),
    );
  }
}
