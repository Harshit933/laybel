import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/home_page.dart';
import 'package:flutter/material.dart';

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
            Padding(
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: Text(
                'You are all set up!!',
                style: font,
              ),
            ),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MaterialButton(
                      // shape: ShapeBorder.lerp(Radius.circular(12), 1.1, 1.1),
                      height: 47,
                      elevation: 0,
                      color: Color.fromRGBO(25, 208, 120, 1),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      child: Text(
                        'Explore App',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'How this works',
              style: TextStyle(
                  color: Color.fromRGBO(25, 208, 120, 1),
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
