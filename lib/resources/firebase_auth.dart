import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/usermodel.dart';
import 'package:firebase/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late UserCredential cred;
  late User? usercred;

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        sendEmailVerification();
      }
      res = "successful";
      print(cred.toString());
    } on FirebaseAuthException catch (e) {
      // we can also put e.code to check for the error and then display custom message

      print(e);
    }
    return res;
  }

  // to get the details of the user, it is connected to the register page of the app
  Future Details({
    required String username,
    required String pronouns,
    required String age,
    required String phonenumber,
    required String? credential,
    required String usernameReal,
    required String profilephoto,
  }) async {
    if (username.isNotEmpty ||
        pronouns.isNotEmpty ||
        age.isNotEmpty ||
        phonenumber.isNotEmpty) {
      usercred = FirebaseAuth.instance.currentUser;

      await _firestore.collection('Users').doc(usercred?.uid).set({
        'username': username,
        'pronouns': pronouns,
        'age': age,
        'phonenumber': phonenumber,
        'uid': usercred?.uid,
        'usernameReal': usernameReal,
        'profilephoto': profilephoto,
      });
      print('success');
    } else {
      print("Data not added");
    }
  }

  Future<void> ChangeProfileImage(Uint8List profileImageasList) async {
    StorageMethods methods = StorageMethods();
    String profileImage = await methods.updatePFP(profileImageasList);

    _firestore
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'profilephoto': profileImage,
    });
  }

  // sending verification mail to the user
  Future<void> sendEmailVerification() async {
    try {
      if (await !(FirebaseAuth.instance.currentUser!.emailVerified)) {
        _auth.currentUser!.sendEmailVerification();
      }
    } catch (e) {
      print(e);
    }
  }

  // for updating the payment details
  Future<void> updatePayment(String upi) async {
    _firestore
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        'UPI': upi,
      },
    );
  }

  // To LogOut the user
  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    print('Succesfully logged out');
  }

  // to get all the user details in the app overall for one time only
  Future<userModel> getUserDetails() async {
    User user = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(user.uid).get();

    // getting the data from the user model in form of map
    return userModel.fromSnap(snap);
  }
}
