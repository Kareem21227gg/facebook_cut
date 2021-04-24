import 'home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Facebook cut',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(66, 103, 178, 1),
      ),
      home: Home(),
    );
  }
}
