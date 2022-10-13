import 'package:firebase/Const/fonts.dart';
import 'package:flutter/material.dart';

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
              padding: EdgeInsets.only(left: 32, right: 25, top: 25),
              child: SizedBox(
                height: 47,
                child: TextField(
                  controller: _paymentcontroller,
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
                      hintText: 'Enter OTP',
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                ),
              ),
            ),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              padding: EdgeInsets.only(left: 35, right: 27, top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      // shape: ShapeBorder.lerp(Radius.circular(12), 1.1, 1.1),
                      height: 47,
                      elevation: 0,
                      color: Color.fromRGBO(25, 208, 120, 1),
                      onPressed: (){},
                      child: Text(
                        'Next',
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
          ],
        ),
      ),
    );
  }
}
