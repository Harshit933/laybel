import 'package:firebase/Screens/login_page.dart';
import 'package:firebase/Screens/register_page.dart';
import 'package:flutter/material.dart';

class startPage extends StatefulWidget {
  const startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  // final VoidCallback showRegisterPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 49,
                width: 297,
                color: Color.fromRGBO(240, 240, 240, 1),
                child: Center(
                  child: Text(
                    'Sign In with Google',
                    selectionColor: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 49,
              width: 297,
              color: Color.fromRGBO(59, 89, 152, 1),
              child: Center(
                child: Text(
                  'Sign In with FaceBook',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Container(
                height: 49,
                width: 297,
                color: Color.fromRGBO(25, 208, 120, 1),
                child: Center(
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Color.fromRGBO(25, 208, 120, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 63,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By continuing you agree to our ',
                    style: TextStyle(
                        fontFamily: 'Inter', fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Terms of service',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
