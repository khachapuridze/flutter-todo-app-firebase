import 'package:flutter/material.dart';
import 'package:flutter_learning/data/helpers/todo_hepler.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _userEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
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
                  controller: _userEditController,
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
                    TodoHelper.userID = _userEditController.text,
                    Navigator.of(context).pushNamed('/home')
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
