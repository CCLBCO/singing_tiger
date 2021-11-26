import 'package:flutter/material.dart';
import 'package:singing_tiger_test/screens/start_page.dart';



void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFD4AC2B),
        scaffoldBackgroundColor: Color(0xFFFF7800),
      ),
      home: StartPage(),
    );
  }
}
