import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';




class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);



  @override
  Widget build(BuildContext context) {



    var snapshotData = snapshot.documents[index];
    var docId = snapshot.documents[index].documentID;

    TextEditingController nameInputController = TextEditingController(text: snapshotData["name"]);
    TextEditingController titleInputController = TextEditingController(text: snapshotData["title"]);
    TextEditingController descriptionInputController = TextEditingController(text: snapshotData["description"]);

    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(snapshotData.data["timestamp"].seconds * 1000);

    var dateFormatted = new DateFormat("EEEE, MMM d,y").format(timeToDate);

    return Column(
      children: <Widget>[

        Container(
          height: 190,
          child: Card(
            elevation: 9,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(snapshotData.data["title"]),
                  subtitle: Text(snapshotData.data["description"]),
                  leading: CircleAvatar(
                    radius: 34,
                    child: Text(snapshotData.data["title"].toString()[0]),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("By ${snapshotData.data["name"]}"),
                      Text(dateFormatted),
                    ],
                  ),
                ),




              ],
            ),

          ),
        ),


        //Text(snapshot.documents[index].data["title"])
      ],
    );

  }
}