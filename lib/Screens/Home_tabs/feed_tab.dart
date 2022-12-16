import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Screens/feed_screen/feed_tab_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../SigninandLogIn/all_logins.dart';

class FeedTab extends StatefulWidget {
  const FeedTab({Key? key}) : super(key: key);

  @override
  State<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    print('Succesfully logged out');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => startPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: logOut,
                color: Colors.purple,
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => FeedTabUI(
                    snap: snapshot.data!.docs[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
