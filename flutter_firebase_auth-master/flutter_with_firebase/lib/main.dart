import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'auth.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter login demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(auth: Auth(),),
    );
  }
}
