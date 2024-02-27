import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_assign/bottomnavigator/bottom_navigator.dart';

import '../../sharedprefrence/prefmanager.dart';

/*class Utils{
  static final _passwordRegex =
  RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  static bool isValidPassword(String password) {
    return _passwordRegex.hasMatch(password);
  }
}*/

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? errorPassword;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buidNameFormField(),
            SizedBox(
              height: 16,
            ),
            buidPasswordFormField(),
            SizedBox(
              height: 16,
            ),
            buildButtonField(),
          ],
        ),
      ),
    );
  }

  buidNameFormField() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter Name";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: "Enter Name",
        hintText: "",
      ),
    );
  }

  buidPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter Password";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: "Enter Password",
        hintText: "",
      ),
    );
  }

  buildButtonField() {
    return MaterialButton(
      color: Color(0XFF95ADBE),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();

          String name = _nameController.text.toString().trim();
          String password = _passwordController.text.toString().trim();

          //resetError();

          /* if(!Utils.isValidPassword(password)){
            // show error on password
            setState(() {
              errorPassword = 'Enter valid password';
            });
          }*/
          PrefManager.updateLoginStatus(true);
          print('''
        Name : ${name}
        Password : ${password}
        ''');
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => bottomnavigator(),
              ),
              (route) => false);
        }
      },
      child: Text(
        'BUTTON',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
