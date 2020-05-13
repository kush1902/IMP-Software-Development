import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth});
  final BaseAuth auth;
  @override
  _LoginPageState createState() => _LoginPageState();

}
enum FormType{
  login,
  register

}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType=FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType==FormType.login){
          String userID= await widget.auth.signInWithEmailAndPassword(_email, _password);
          print("Signed in : $userID");

        }
        else{
          String userID= await widget.auth.createUserWithEmailAndPassword(_email, _password);
          print("Registered user : $userID");
        }
      } catch (e) {
        print("error");
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType=FormType.register;
    });
  }
  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType=FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login demo page"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs()+buildSubmitButtons(),
          ),
        ),
      ),
    );
  }
  List <Widget> buildInputs(){
    return[
      TextFormField(
        decoration: InputDecoration(
          labelText: 'email',
        ),
        validator: (value) =>
        value.isEmpty ? 'email cannot be empty' : null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'password',
        ),
        obscureText: true,
        validator: (value) =>
        value.isEmpty ? 'password cannot be empty' : null,
        onSaved: (value) => _password = value,
      ),

    ];
  }
  List<Widget> buildSubmitButtons(){
    if (_formType==FormType.login ){
      return[
        RaisedButton(
          onPressed: validateAndSubmit,
          child: Text(
            "Login Button",
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        FlatButton(
          onPressed: moveToRegister,
          child: Text(
            "Create an account",
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ];
    }else{
      return[
        RaisedButton(
          onPressed: validateAndSubmit,
          child: Text(
            "Create an Account",
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        FlatButton(
          onPressed: moveToLogin,
          child: Text(
            "Have an account ? Login",
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ];
    }
  }
}
