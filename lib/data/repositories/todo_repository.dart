import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_learning/data/helpers/todo_hepler.dart';

import 'package:flutter_learning/data/models/todo.dart';

class TodoRepository extends ChangeNotifier {
  final List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void add(Todo todo) => TodoHelper.addItem(todo);

  void update(Todo todo) {
    TodoHelper.updateItem(todo);
    notifyListeners();
  }

  void delete(String id, {docID}) {
    TodoHelper.deleteItem(docID: id);
    notifyListeners();
  }

  void toggleDone(String id) {
    var index = _todos.indexWhere((element) => element.id == id);

    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void remove(String id) {
    TodoHelper.deleteItem(docID: id);
    notifyListeners();
  }
}
