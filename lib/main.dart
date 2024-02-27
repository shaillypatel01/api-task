import 'package:flutter/material.dart';
import 'package:task_assign/login_screen/login.dart';
import 'package:task_assign/sharedprefrence/prefmanager.dart';
import 'package:task_assign/theme.dart';

import 'bottomnavigator/bottom_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefManager.init(); // initialize here ! important
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      title: 'Material App',
      home: PrefManager.getLoginStatus() ? bottomnavigator() : LoginScreen(),
    );
  }
}
