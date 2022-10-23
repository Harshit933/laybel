import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/all_logins.dart';
import 'package:firebase/read_data/get_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class tabOptions extends StatelessWidget {
  const tabOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.shopping_bag,
        size: 50,
        color: Colors.black,
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  bool _isLogOut = false;

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    print('Succesfully logged out');
    _isLogOut = true;
  }

  List tabOptions = const [
    ["Feed", 'tabOptions()']
  ];

  List<Widget> docIDs = [
    Icon(
      Icons.shopping_bag,
      size: 50,
      color: Colors.black,
    ),
    Icon(
      Icons.shopping_bag,
      size: 50,
      color: Colors.black,
    ),
    Icon(
      Icons.shopping_bag,
      size: 50,
      color: Colors.black,
    ),
  ];

  // Future gETIDs() async {
  //   await FirebaseFirestore.instance.collection('users').get().then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (document) {
  //             print(document.reference);
  //             docIDs.add(document.reference.id);
  //           },
  //         ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          toolbarHeight: 88,
          centerTitle: true,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 2,
                child: Text(
                  'Laybel',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.blue,
                    fontSize: 50,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.shopping_bag,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Feed',
                  ),
                  Tab(
                    text: 'Explore',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
MaterialButton(
              onPressed: () async {
                await logOut();
                if (_isLogOut) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => startPage(),
                    ),
                  );
                }
              },
              color: Colors.orange,
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
 */
