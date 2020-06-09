import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage > {
  var firestoreDb = Firestore.instance.collection("servicing done").snapshots();
  TextEditingController nameInputController;
  TextEditingController problemInputController;
  TextEditingController partsInputController;
  TextEditingController costInputController;

  @override

  void initState() {
    super.initState();
    nameInputController=TextEditingController();
    problemInputController = TextEditingController();
    partsInputController = TextEditingController();
    costInputController = TextEditingController();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Service Request"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _showDialog(context);
      }, child: Icon(Icons.weekend),
      ),
    );
  }
  _showDialog(BuildContext context) async{

    await showDialog(context: context,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            children: <Widget>[
              Text("Generate Service Request"),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Name of Organisation"
                    ),
                    controller: nameInputController,
                  )
              ),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Describe the issue "
                    ),
                    controller: problemInputController,
                  )
              ),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Any Parts Changed"
                    ),
                    controller: partsInputController,
                  )
              ),
              Expanded(
                  child: TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Costing of the Parts"
                    ),
                    controller: costInputController,
                  )
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: (){
              nameInputController.clear();
              problemInputController.clear();
              partsInputController.clear();
              costInputController.clear();
              Navigator.pop(context);
            },
                child: Text("Cancel")),
            FlatButton(onPressed: (){
              if(nameInputController.text.isNotEmpty &&
                  problemInputController.text.isNotEmpty &&
                  partsInputController.text.isNotEmpty &&
                  costInputController.text.isNotEmpty)
              {
                Firestore.instance.collection("test")
                    .add({
                  "Name of Organisation": nameInputController.text,
                  "Description of the issue": problemInputController.text,
                  "Parts Changed": partsInputController.text,
                  "Costing of the parts":costInputController.text,
                  "timestamp": new DateTime.now()
                }).then((response){
                  print(response.documentID);
                  Navigator.pop(context);
                  nameInputController.clear();
                  problemInputController.clear();
                  partsInputController.clear();
                  costInputController.clear();
                }).catchError((error)=> print(error) );
              }

            },
                child: Text("Save"),)

          ],
        ));
  }
}