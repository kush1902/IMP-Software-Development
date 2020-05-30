import 'package:flutter/material.dart';
import 'package:pages/admin_query.dart';
import 'package:pages/register_page.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Admin Dashboard"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  ),
                },
                child: Text("Register new user"),
              ),
              FlatButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QueryAdmin(),
                    ),
                  ),
                },
                child: Text("View Queries"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
