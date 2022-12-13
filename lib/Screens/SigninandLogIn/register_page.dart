import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Screens/SigninandLogIn/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Const/fonts.dart';
import '../../resources/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  late var var1;

  void signUp() async {
    if (_password.text.trim() == _confirmPassword.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    }
  }

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_left),
          iconSize: 45,
        ),
        shadowColor: null,
        elevation: 0,
        foregroundColor: Color.fromRGBO(218, 218, 218, 1),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    'Create\nAccount',
                    style: font,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 31, right: 31, top: 16),
              child: SizedBox(
                height: 47,
                child: TextField(
                  controller: _email,
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
                    hintText: 'Email',
                    hintStyle: placeholder,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 31, right: 31, top: 15),
              child: SizedBox(
                height: 47,
                child: TextField(
                  obscureText: true,
                  controller: _password,
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
                    hintText: 'Password',
                    hintStyle: placeholder,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 31, right: 31, top: 15),
                child: SizedBox(
                  height: 47,
                  child: TextField(
                    controller: _confirmPassword,
                    obscureText: true,
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
                      hintText: 'Confirm Password',
                      hintStyle: placeholder,
                    ),
                  ),
                )),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              padding: EdgeInsets.only(left: 31, right: 31, top: 16),
              child: GestureDetector(
                onTap: () {
                  auth.signUp(
                    email: _email.text,
                    password: _password.text,
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => VerifyPage(Email: _email),
                    ),
                  );
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
                        'Sign Up',
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
