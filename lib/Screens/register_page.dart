import 'package:email_auth/email_auth.dart';
import 'package:firebase/Screens/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Const/fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

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


  Future signUp() async {
      if(_password.text.trim() == _confirmPassword.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim());
        addUserDetails(_firstName.text.trim(), _lastName.text.trim(), int.parse(_age.text.trim()), _email.text.trim());
      }
      /// TO implement navigator function to verify otp.
  }
  void sendOTP() async{
    final emailAuth = new EmailAuth(sessionName: "new session");
    bool result = await emailAuth.sendOtp(
      recipientMail: _email.value.text, otpLength: 4,
    );
    if(result) {
      print('OTP Sent');
    } else {
      print("Not sent");
    }
  }

  Future addUserDetails(String firstName, String lastName, int age, String Email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'First name' :firstName,
      'Last Name' :lastName,
      'Age' : age,
      'email' : Email,
    });
  }

  void onPressedFunction() {
    setState(() {
      var1 =  _email.text;
    });
  }

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30 ),
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
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
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
                        hintStyle: TextStyle(
                            fontSize: 14
                        )
                    ),
                  ),
                )
            ),
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
                        hintStyle: TextStyle(
                            fontSize: 14
                        )
                    ),
                  ),
                )
            ),
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
                        signUp();
                        sendOTP();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyPage(Email: _email),));
                      },
                      child: Text(
                        'Sign In',
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member ?',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                    ' Login Here!',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
