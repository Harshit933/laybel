import 'package:firebase/Screens/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Const/fonts.dart';
import '../resources/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _age = TextEditingController();
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
              padding: EdgeInsets.only(left: 31, right: 25, top: 25),
              child: SizedBox(
                height: 47,
                child: TextField(
                  controller: _email,
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
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 31, right: 25, top: 15),
                child: SizedBox(
                  height: 47,
                  child: TextField(
                    obscureText: true,
                    controller: _password,
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
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 31, right: 25, top: 15),
                child: SizedBox(
                  height: 47,
                  child: TextField(
                    controller: _confirmPassword,
                    obscureText: true,
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
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      // shape: ShapeBorder.lerp(Radius.circular(12), 1.1, 1.1),
                      height: 47,
                      elevation: 0,
                      color: Color.fromRGBO(25, 208, 120, 1),
                      onPressed: () {
                        // auth.signUp(
                        //     email: _email.text.trim(),
                        //     password: _password.text.trim());
                        auth.signUp(
                          email: _email.text,
                          password: _password.text,
                        );
                        // sendOTP();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VerifyPage(Email: _email),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ],
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
