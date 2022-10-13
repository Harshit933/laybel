import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/read_data/get_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  List<String> docIDs = [];

  Future gETIDs() async {
    await FirebaseFirestore.instance.collection('users').get().then(
        (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              onPressed: logOut,
              color: Colors.orange,
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: gETIDs(),
                builder: (context, snapshot){
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder:(context,index){
                    return ListTile(
                      title: getDetails(documentID: docIDs[index]),
                    );
                  });
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
