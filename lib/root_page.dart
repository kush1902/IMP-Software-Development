import 'package:flutter/material.dart';
import 'home_page.dart';
import "LoginPage.dart";
import 'auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) => {
      setState((){
       // _authStatus =userId == null ? AuthStatus.notSignedIn:AuthStatus.signedIn;
      }),
    });
  }
  void _signedIn(){
    setState(() {
      _authStatus=AuthStatus.signedIn;
    });
  }
  void _signedOut(){
    setState(() {
      _authStatus=AuthStatus.notSignedIn;
    });
  }
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
          auth: widget.auth,
          onsignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return HomePage1(
          auth: widget.auth,
          onsignedOut: _signedOut,
        );
    }
  }
}
