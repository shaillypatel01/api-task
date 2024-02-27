import 'package:flutter/material.dart';
import 'package:task_assign/login_screen/components/login_form.dart';

import 'components/lauout_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD3E0EA),
      body: SafeArea(
        child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    LayoutHeader(),
                    LoginForm(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
