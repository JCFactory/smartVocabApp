import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CardInformation extends StatefulWidget {
  @override
    _CardInformationState createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('vocabModel_01').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['hindi']),
              subtitle: Text(data['english']),
            );
          }).toList(),
        );
      },
    );
  }
}