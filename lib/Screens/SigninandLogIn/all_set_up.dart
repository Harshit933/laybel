import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/Home%20and%20Directory/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSetUp extends StatefulWidget {
  const AllSetUp({Key? key}) : super(key: key);

  @override
  State<AllSetUp> createState() => _AllSetUpState();
}

class _AllSetUpState extends State<AllSetUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 27, top: 16),
                  child: Text(
                    'You are all\nset up!!',
                    style: font,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
                  padding: EdgeInsets.only(left: 31, right: 31, top: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
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
                                'Explore App',
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'How this works',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(157, 62, 216, 1),
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
