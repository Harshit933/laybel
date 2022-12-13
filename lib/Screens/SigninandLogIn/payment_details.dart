import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/firebase_auth.dart';
import 'all_set_up.dart';
import 'package:firebase/Const/fonts.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final _paymentcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32),
              child: Text(
                'Payment\nDetails',
                style: font,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 31, right: 31, top: 16),
              child: SizedBox(
                height: 49,
                width: 328,
                child: TextField(
                  controller: _paymentcontroller,
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
                    hintText: 'Enter UPI ID',
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
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Auth auth = Auth();
                      await auth.updatePayment(_paymentcontroller.text);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => AllSetUp()));
                      print('done');
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
                            'Next',
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
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AllSetUp()));
                  },
                  child: Text(
                    'Set Up Later',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(157, 62, 216, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
