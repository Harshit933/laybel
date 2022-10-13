import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class getDetails extends StatelessWidget {
  final String documentID;

  getDetails({Key? key, required this.documentID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<
                String,
                dynamic>;
            return Text('First Name : ${data['First name']}');
          }
          return Text('Loading..');
        })
    );
  }
}