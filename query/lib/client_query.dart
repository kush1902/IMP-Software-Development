import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage > {
  var firestoreDb = Firestore.instance.collection("test").snapshots();
  TextEditingController nameInputController;
  TextEditingController titleInputController;
  TextEditingController descriptionInputController;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    nameInputController = TextEditingController();
    titleInputController = TextEditingController();
    descriptionInputController = TextEditingController();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Query page"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _showDialog(context);
      }, child: Icon(Icons.edit),
      ),
    );
  }
  _showDialog(BuildContext context) async{

    await showDialog(context: context,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            children: <Widget>[
              Text("Please Fill out the form"),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Your Name*"
                    ),
                    controller: nameInputController,
                  )
              ),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Title*"
                    ),
                    controller: titleInputController,
                  )
              ),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Description*"
                    ),
                    controller: descriptionInputController,
                  )
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: (){
              nameInputController.clear();
              titleInputController.clear();
              descriptionInputController.clear();

              Navigator.pop(context);
            },
                child: Text("Cancel")),
            FlatButton(onPressed: (){
              if(titleInputController.text.isNotEmpty &&
                  nameInputController.text.isNotEmpty &&
                  descriptionInputController.text.isNotEmpty)
              {
                Firestore.instance.collection("test")
                    .add({
                  "name": nameInputController.text,
                  "title": titleInputController.text,
                  "description": descriptionInputController.text,
                  "timestamp": new DateTime.now()
                }).then((response){
                  print(response.documentID);
                  Navigator.pop(context);
                  nameInputController.clear();
                  titleInputController.clear();
                  descriptionInputController.clear();
                }).catchError((error)=> print(error) );
              }

            },
                child: Text("Save"))

          ],
        ));
  }
}