import 'package:flutter/material.dart';
import 'package:skillbox_home_work5/examples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeWorkExample(),
      color: Colors.blue[50],
    );
  }
}
