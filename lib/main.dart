import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/data/repositories/todo_repository.dart';

import 'package:flutter_learning/presentation/router/app_routers.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TodoRepository(),
      child: MaterialApp(
        title: 'flutter todo - firebase',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
