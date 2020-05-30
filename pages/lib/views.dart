import 'package:flutter/material.dart';
import 'package:pages/admin_dashboard.dart';

import 'package:pages/signin_page.dart';

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
                builder: (context) => AdminDashboard(),
              ),
            ),
            child: Text("Admin"),
          ),
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInPage(),
              ),
            ),
            child: Text("Client"),
          ),
        ],
      ),
    );
  }
}
