import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/post_model.dart';
import 'package:firebase/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

import 'add_post_helper.dart';

class FirestoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// add likes and comments field

  Future<String> uploadPost({
    required String description,
    required String uid,
    required String location,
    required String Department,
    required String Category,
    required String brand,
    required List<String> Sizes,
    required String prize,
    required String usernameReal,
    required List likes,
    required DateTime datePublished,
  }) async {
    String res = "Some error occured";
    try {
      List<String> photourl = await StorageMethods()
          .uploadImageStorage('posts', AddpostHelper().getNotnull(), true);

      String postId = const Uuid().v1();

      PostModel model = PostModel(
        uid: uid,
        photoUrl: photourl,
        Description: description,
        Location: location,
        Department: Department,
        Category: Category,
        brand: brand,
        Sizes: Sizes,
        prize: prize,
        usernameReal: usernameReal,
        likes: [],
        postId: postId,
        datePublished: datePublished,
      );

      _firestore.collection('posts').doc(postId).set(model.toJson());

      res = "Correct";
    } catch (err) {
      print(err.toString());
    }

    return res;
  }

  // adding likes to the post
  Future<void> addLikes(String uid, String postId, List likes) async {
    try {
      // if the user has already liked this post then remove it from his likes
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        // else we will like the post
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print("Some error occured" + "${e}");
    }
  }

  // adding comments to the particular post in Firebase
  Future<void> addComments(
      String postId, String comment, String uid, String username) async {
    try {
      String commentId = const Uuid().v1();
      _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .set({
        'comment': comment,
        'uid': uid,
        'datePublished': DateTime.now(),
        'username': username,
      });
    } catch (e) {
      throw e;
    }
  }
}
