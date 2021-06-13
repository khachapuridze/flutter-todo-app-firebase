import 'package:flutter/material.dart';
import 'package:flutter_learning/presentation/screens/edit_screen.dart';
import 'package:flutter_learning/presentation/screens/home_screen.dart';
import 'package:flutter_learning/presentation/screens/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    } else if (settings.name == '/home') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/add-todo') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/edit-todo') {
      var title = settings.arguments as String;
      var description = settings.arguments as String;
      var docId = settings.arguments as String;
      var isDone = settings.arguments as bool;

      return MaterialPageRoute(
          builder: (_) => EditTodoScreen(
              title: title,
              description: description,
              docID: docId,
              isDone: isDone));
    } else {
      return null;
    }
  }
}
