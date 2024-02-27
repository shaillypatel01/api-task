import 'package:flutter/material.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50,
        foregroundImage: AssetImage("assets/images/person.png"),
        foregroundColor: Color(0XFFE4FBFF),
      ),
    );
  }
}
