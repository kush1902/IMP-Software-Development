import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_client_side/CustomCard.dart';

class QueryAdmin extends StatefulWidget {
  @override
  _QueryAdminState createState() => _QueryAdminState();
}

class _QueryAdminState extends State<QueryAdmin> {
  var firestoreDb = Firestore.instance.collection("test").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Query Page admin side"),


      ),

      body: StreamBuilder(
          stream: firestoreDb,
          builder: (context,snapshot) {
          if(!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
                return CustomCard(snapshot: snapshot.data, index: index);
          });
      }),
    );
  }
}
