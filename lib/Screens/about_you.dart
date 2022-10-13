import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/payment_details.dart';
import 'package:flutter/material.dart';

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

  Future addUserDetails(String Name, String Age, String Pronouns, String PhoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name' :Name,
      'Age' :Age,
      'Pronouns' : Pronouns,
      'email' : PhoneNumber,
    });
  }

  void nextPage () async {
    addUserDetails(_name.text.trim(), _age.text.trim(), _pronouns.text.trim(), _phonenumber.text.trim());
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentDetails()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 33),
              child: Text(
                'About\nYou',
                style: font,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: SizedBox(
                height: 47,
                child: TextField(
                  decoration: InputDecoration(
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
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                  controller: _name,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: SizedBox(
                height: 47,
                child: TextField(
                  decoration: InputDecoration(
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
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                  controller: _age,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: SizedBox(
                height: 47,
                child: TextField(
                  decoration: InputDecoration(
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
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                  controller: _pronouns,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: SizedBox(
                height: 47,
                child: TextField(
                  decoration: InputDecoration(
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
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                  controller: _phonenumber,
                ),
              ),
            ),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      // shape: ShapeBorder.lerp(Radius.circular(12), 1.1, 1.1),
                      height: 47,
                      elevation: 0,
                      color: Color.fromRGBO(25, 208, 120, 1),
                      onPressed: nextPage,
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
