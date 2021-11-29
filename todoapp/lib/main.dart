import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/http/operations.dart';
import 'pages/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PutaQuePariu(0),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
