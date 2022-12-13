import 'package:firebase/Screens/SigninandLogIn/register_page.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
                decoration: ShapeDecoration(
                  color: Color(0xffd9d9d9),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.6,
                    ),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   FeatherIcons.gitCommit,
                      //   size: 30,
                      //   color: Colors.grey[700],
                      // ),
                      Image.asset('Icons/google icon.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign In with Google',
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
              decoration: ShapeDecoration(
                color: Color.fromRGBO(59, 89, 152, 1),
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 10,
                    cornerSmoothing: 0.6,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Sign In with FaceBook',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.spaceGrotesk(
                    color: Color(0xfff0f0f0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
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
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  //
                  child: Text(
                    'Log In',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromRGBO(157, 62, 216, 1),
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
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Color(0xff111111),
                    ),
                  ),
                  Text(
                    'Terms of service',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xff111111),
                    ),
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
