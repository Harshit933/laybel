import 'package:cloud_firestore/cloud_firestore.dart';

class userModel {
  final String username;
  final String? uid;
  final String pronouns;
  final String age;
  final String phonenumber;
  final String usernameReal;
  final String profilephoto;

  const userModel({
    required this.username,
    required this.uid,
    required this.pronouns,
    required this.age,
    required this.phonenumber,
    required this.usernameReal,
    required this.profilephoto,
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
      usernameReal: snapshot['usernameReal'],
      profilephoto: snapshot['profilephoto'],
    );
  }
}
