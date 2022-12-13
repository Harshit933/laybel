import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userModel {
  final String username;
  final String? uid;
  final String pronouns;
  final String age;
  final String phonenumber;

  const userModel({
    required this.username,
    required this.uid,
    required this.pronouns,
    required this.age,
    required this.phonenumber,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'pronouns': pronouns,
        'age': age,
        'phonenumber': phonenumber,
      };

  // returning the user data as a Map
  static userModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return userModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      pronouns: snapshot['pronouns'],
      age: snapshot['age'],
      phonenumber: snapshot['phonenumber'],
    );
  }
}
