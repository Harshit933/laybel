import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SearchUser {
  Future getDetailsUser(String uid) async {
    final user =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    return user['profilephoto'];
  }
}
