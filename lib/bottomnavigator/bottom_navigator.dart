import 'package:flutter/material.dart';
import '../screens/homescreen.dart';

class bottomnavigator extends StatefulWidget {
  const bottomnavigator({super.key});

  @override
  State<bottomnavigator> createState() => _bottomnavigatorState();
}

class _bottomnavigatorState extends State<bottomnavigator> {

  int selectedindex = 0;
  final screene = [
    HomeScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screene[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
              selectedindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: ""
          ),
          BottomNavigationBarItem(icon: Icon(Icons.videocam),
          label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library),
          label: "")
        ],
      ),
    );

  }
}
