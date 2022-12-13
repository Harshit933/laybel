import 'dart:ffi';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/SigninandLogIn/payment_details.dart';
import 'package:firebase/resources/storage_methods.dart';
import 'package:firebase/utils/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../resources/firebase_auth.dart';

class AboutYou extends StatefulWidget {
  const AboutYou({Key? key}) : super(key: key);

  @override
  State<AboutYou> createState() => _AboutYouState();
}

class _AboutYouState extends State<AboutYou> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _pronouns = TextEditingController();
  final _phonenumber = TextEditingController();
  final _usernamecontroller = TextEditingController();
  late String profilePhoto;
  Auth auth = Auth();

  Future addUserDetails(
      String Name, String Age, String Pronouns, String PhoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name': Name,
      'Age': Age,
      'Pronouns': Pronouns,
      'email': PhoneNumber,
    });
  }

  /// checking all the details are valid or not like if there is a file missing or not

  void nextPage() async {
    String? user;
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser);
      user = await FirebaseAuth.instance.currentUser?.uid;
    }
    auth.Details(
      username: _name.text,
      pronouns: _pronouns.text,
      age: _age.text,
      phonenumber: _phonenumber.text,
      credential: user,
      usernameReal: _usernamecontroller.text,
      profilephoto: profilePhoto,
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PaymentDetails()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 33),
                child: Text('About\nYou', style: font),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Uint8List profilePhotoinList =
                          await imagepicker(ImageSource.gallery);
                      StorageMethods meth = StorageMethods();
                      profilePhoto =
                          await meth.updateprofilePhoto(profilePhotoinList);
                    },
                    child: CircleAvatar(
                      radius: 40,
                      // backgroundImage: NetworkImage(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                child: SizedBox(
                  height: 47,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText: 'Name',
                      hintStyle: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        color: Color(0xff767676),
                      ),
                    ),
                    controller: _name,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                child: SizedBox(
                  height: 47,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText: 'Age',
                      hintStyle: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        color: Color(0xff767676),
                      ),
                    ),
                    controller: _age,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                child: SizedBox(
                  height: 47,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText: 'Pronouns',
                      hintStyle: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        color: Color(0xff767676),
                      ),
                    ),
                    controller: _pronouns,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                child: SizedBox(
                  height: 49,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText: 'Phone number',
                      hintStyle: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        color: Color(0xff767676),
                      ),
                    ),
                    controller: _phonenumber,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                child: SizedBox(
                  height: 49,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText: 'Username',
                      hintStyle: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        color: Color(0xff767676),
                      ),
                    ),
                    controller: _usernamecontroller,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
                    padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                    child: GestureDetector(
                      onTap: nextPage,
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
                              'Next',
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
            ],
          ),
        ),
      ),
    );
  }
}
