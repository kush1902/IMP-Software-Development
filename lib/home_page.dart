import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage1 extends StatelessWidget {
  final BaseAuth auth;
  final VoidCallback onsignedOut;

  HomePage1({this.auth, this.onsignedOut});

  void _signOut() async {
    try {
      await auth.signOut();
      onsignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "LogOut",
              style: TextStyle(fontSize: 17.0),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "welcome",
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
    );
  }
}
