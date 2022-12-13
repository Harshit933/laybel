import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../SigninandLogIn/all_logins.dart';

class FeedTab extends StatefulWidget {
  const FeedTab({Key? key}) : super(key: key);

  @override
  State<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    print('Succesfully logged out');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => startPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          onPressed: logOut,
          color: Colors.purple,
          child: Text(
            'Log Out',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
