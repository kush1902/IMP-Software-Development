import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {

  Map<String, bool> values = {
    'Trolley': false,
    'Hoist Mechanism': false,
    'M.H.Gear Box': false,
    'Input Shaft': false,
    'Intermediate P/Shaft': false,
    'Output Shaft': false,
    'Output Gear': false,
    'Intermediate Gear': false,
    'M.H Drum': false,
    'Bottom Block':false,
    'A.H Drum':false,
    'Geared Coupling':false,
    'Lubrication Checking':false,
    'M.H Drum P/Block':false,
    'Wire Rope':false,
    'Equilizer Pulley':false,
    'A.H Drum P/Block':false,
    'Tightening':false,
    'Fasteners of M.H Gear Box':false,
    'Fasteners of M.H Gear Box Base':false,
    'Fasteners of Bottom Block':false,
    'Fasteners of Drum':false,
    'Fasteners of all Geared Coupling':false,
    'C.T Mechanism':false,
    'C.T Whell':false,
    'C.T Axle':false,
    'C.T Axle Box':false,
    'Bearing Covers':false,
    'C.T Gear Box':false,
    'Fasteners of C.T Gear Box':false,
    'Fasteners of C.T Gear Box Base':false,
    'Fasteners of C.T Axle Box fixing':false,
    'Fasteners of C.T Axle Box Bearing Covers':false,
    'Fasteners of Motor Base':false,
    'Fasteners of '
    'L.T Mechanism':false,
    'L.T Whell':false,
    'L.T Axle':false,
    'L.T Axle Box':false,
    'L.T Gear Box':false,
  };

  var tmpArray = [];

  getCheckboxItems() async{
    values.forEach((key, value) async {
      if (value == true) {
        tmpArray.add(key);
      }
      if (tmpArray == true){
        DocumentReference ref= await db.collection('CRUD').add({
          "array":"$tmpArray"
      },);
      setState(()=>ref.documentID);
      print("$tmpArray");
      }
    });

// Printing all selected items on Terminal screen.
    print(tmpArray);
// Here you will get all your selected Checkbox items.

// Clear array after use.
    tmpArray.clear();
  }
  final db=Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      RaisedButton(
        child: Text(
          " Get Selected Checkbox Items ", style: TextStyle(fontSize: 18),),
        onPressed: getCheckboxItems,
        color: Colors.deepOrange,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),

      Expanded(
        child:
        ListView(
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: values[key],
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  values[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}