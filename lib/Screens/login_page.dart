import 'package:firebase/Const/fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _email = TextEditingController();
  final _password = TextEditingController();


  Future signUp() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim());
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 25),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email'
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password'
                  ),
                )
            ),
            SizedBox(height: 15),
            MaterialButton(
              elevation: 0,
              color: Colors.orange,
              onPressed: signUp,
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member ?',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                    ' Register Here!',
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
