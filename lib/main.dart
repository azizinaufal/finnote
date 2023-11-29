import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:finnote/pages/main_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
