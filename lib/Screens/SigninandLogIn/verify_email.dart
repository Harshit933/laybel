import 'dart:async';

import 'package:email_auth/email_auth.dart';
import 'package:firebase/Screens/about_you.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resources/firebase_auth.dart';

class VerifyPage extends StatefulWidget {
  final Email;
  const VerifyPage({Key? key, required this.Email}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

/// to implement try catch block to catch errors in Verfied OTP.

class _VerifyPageState extends State<VerifyPage> {
  bool isEmailVerified = false;
  final _otpcontroller = TextEditingController();
  Auth auth = Auth();
  Timer? timer;

  // @override
  void initState() {
    if (!isEmailVerified) {
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
    super.initState();
  }

  void ver() async {
    isEmailVerified = await FirebaseAuth.instance.currentUser!.emailVerified;
  }

  @override
  void dispose() {
    _otpcontroller.dispose();
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? AboutYou()
      : Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Verify Your Email')),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  auth.sendEmailVerification();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Color.fromRGBO(25, 208, 120, 1),
                    child: Center(
                      child: Text(
                        'Send Verification E-mail',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
}
