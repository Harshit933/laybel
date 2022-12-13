import 'dart:async';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../resources/firebase_auth.dart';
import 'about_you.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Padding(
                padding: EdgeInsets.only(left: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Verify\nEmail',
                      style: font,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 71, right: 71),
                child: Text(
                  'A verification email has already been sent to your mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Space-Regular',
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
                padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                child: GestureDetector(
                  onTap: () {
                    auth.sendEmailVerification();
                  },
                  child: InkWell(
                    splashColor: Colors.white,
                    child: Container(
                      height: 49,
                      width: 328,
                      decoration: ShapeDecoration(
                        color: Color.fromRGBO(157, 62, 216, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Resend verification mail',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xfff3f3f3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
}
