import 'package:flutter/material.dart';
import 'package:flutter_learning/data/models/todo.dart';
import 'package:flutter_learning/data/repositories/todo_repository.dart';
import 'package:provider/provider.dart';

class EditTodoScreen extends StatefulWidget {
  EditTodoScreen(
      {Key? key,
      required this.title,
      required this.description,
      required this.docID,
      required this.isDone})
      : super(key: key);
  final String title;
  final String description;
  final String docID;
  final bool isDone;

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late TextEditingController _todoTitleEditController;

  late TextEditingController _todoDescriptionEditController;
  @override
  void initState() {
    super.initState();
    _todoTitleEditController = TextEditingController(text: widget.title);
    _todoDescriptionEditController =
        TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
     var todo = Todo(id:widget.docID,title: _todoTitleEditController.text,description:_todoDescriptionEditController.text,isDone: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo - $_todoTitleEditController'),
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
                    
                    Provider.of<TodoRepository>(context, listen: false).update(todo),
                    Navigator.pop(context),
                  },
                  child: Text("Edit Todo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
