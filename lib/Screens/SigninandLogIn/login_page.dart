import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Screens/Home%20and%20Directory/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  late bool _issignedIn;

  /// Try Catch
  Future signUp() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } catch (err) {
      print(err);
    }
  }

  Future check() async {
    User? chec = await FirebaseAuth.instance.currentUser;
    if (chec != null) {
      _issignedIn = true;
    } else {
      _issignedIn = false;
    }
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31),
              child: Container(
                child: Text(
                  'Welcome\nback!',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 31, right: 31, top: 16, bottom: 16),
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
                    hintText: 'E-mail or username',
                    hintStyle: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      color: Color(0xff767676),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 31, right: 31),
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
                    hintStyle: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      color: Color(0xff767676),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              padding: EdgeInsets.only(left: 31, right: 31, top: 16),
              child: GestureDetector(
                onTap: () async {
                  await signUp();
                  await check();
                  if (_issignedIn) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } else {
                    print('Kuch galat ho rha hai');
                  }
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
                        'Log In',
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
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff111111),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
