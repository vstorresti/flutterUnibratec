import 'package:flutter/material.dart';
import 'view/home.dart';

class MyNewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'My App List',
    theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.blueAccent,
    ),
    home: ListPage(),
  );
}