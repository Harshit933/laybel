import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostModel {
  final String? uid;
  final List<dynamic> photoUrl;
  final String Description;
  final String Location;
  final String Department;
  final String Category;
  final String brand;
  final List<dynamic> Sizes;
  final String prize;
  final String usernameReal;
  final List likes;
  final String postId;
  final DateTime datePublished;

  const PostModel({
    required this.uid,
    required this.photoUrl,
    required this.Description,
    required this.Location,
    required this.Department,
    required this.Category,
    required this.brand,
    required this.Sizes,
    required this.prize,
    required this.usernameReal,
    required this.likes,
    required this.postId,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'photoUrl': photoUrl,
        'Description': Description,
        'Location': Location,
        'Department': Department,
        'Category': Category,
        'brand': brand,
        'Sizes': Sizes,
        'prize': prize,
        'usernameReal': usernameReal,
        'likes': likes,
        'postId': postId,
        'datePublished': datePublished,
      };

  // returning the user data as a Map
  static PostModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      Description: snapshot['Description'],
      Location: snapshot['Location'],
      Department: snapshot['Department'],
      Category: snapshot['Category'],
      brand: snapshot['brand'],
      Sizes: snapshot['Sizes'],
      prize: snapshot['prize'],
      usernameReal: snapshot['usernameReal'],
      likes: snapshot['likes'],
      postId: snapshot['postId'],
      datePublished: DateTime.timestamp(),
    );
  }
}
