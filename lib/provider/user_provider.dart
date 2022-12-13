import 'package:firebase/Const/add_post_util.dart';
import 'package:firebase/models/usermodel.dart';
import 'package:flutter/material.dart';
import '../resources/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  userModel? _user;
  final Auth _auth = Auth();

  userModel get getUser => _user!;

  Future<void> refreshUser() async {
    userModel user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
