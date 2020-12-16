import 'package:flutter/material.dart';
import 'package:query/admin_query.dart';
import 'package:query/client_query.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Views"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QueryAdmin(),
                    ),
                  ),
                },
                child: Text("Admin"),
              ),
              RaisedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QueryPage(),
                    ),
                  ),
                },
                child: Text("Client"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
