import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<String>> uploadImageStorage(
      String childName, List<Uint8List> post, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    List<String> downloadUrlLink = [];

    String postNumber = Uuid().v1();
    ref = ref.child(postNumber);

    for (int i = 0; i < post.length; i++) {
      String postId = Uuid().v4();
      UploadTask uploadTask = ref.child(postId).putData(post[i]);
      TaskSnapshot snap = await uploadTask;
      String downloadurl = await snap.ref.getDownloadURL();
      downloadUrlLink.add(downloadurl);
    }

    print(_auth.currentUser!.uid);

    return downloadUrlLink;
  }

  // updating profile photo
  Future<String> updateprofilePhoto(Uint8List profilephoto) async {
    Reference ref = _storage.ref().child('Users').child(_auth.currentUser!.uid);
    String profileId = Uuid().v1();
    UploadTask uploadTask = ref.child(profileId).putData(profilephoto);
    TaskSnapshot snap = await uploadTask;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }

  // updating profile image in about you
  Future<String> updatePFP(Uint8List profileImage) async {
    _storage.ref().child('Users').child(_auth.currentUser!.uid).delete();
    UploadTask ref = _storage
        .ref()
        .child('Users')
        .child(_auth.currentUser!.uid)
        .putData(profileImage);
    TaskSnapshot snap = await ref;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }
}
