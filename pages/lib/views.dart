import 'package:flutter/material.dart';
import 'package:pages/homepage.dart';

class Views extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            ),
            child: Text("Admin"),
          ),
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            ),
            child: Text("Client"),
          ),
        ],
      ),
    );
  }
}
