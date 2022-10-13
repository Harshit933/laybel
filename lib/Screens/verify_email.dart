import 'package:email_auth/email_auth.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/about_you.dart';
import 'package:flutter/material.dart';


class VerifyPage extends StatefulWidget {
  final Email;
  const VerifyPage({Key? key,required this.Email}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

/// to implement try catch block to catch errors in Verfied OTP.


class _VerifyPageState extends State<VerifyPage> {

  // final TextEditingController _otpController = TextEditingController();
  final  _otpcontroller = TextEditingController();


  late EmailAuth emailAuth;

  // void sendOTP() async{
  //   bool result = await emailAuth.sendOtp(
  //     recipientMail: widget.Email.value.text, otpLength: 4,
  //   );
  //   if(result) {
  //     print('OTP Sent');
  //   } else {
  //     print("Not sent");
  //   }
  // }

  bool verifyOTP() {
    var var1 = widget.Email;
    bool result = emailAuth.validateOtp(
        recipientMail: var1.text.trim(),
        userOtp: _otpcontroller.text.trim());
    return result;
  }

  @override
  void initState() {
    emailAuth = new EmailAuth(sessionName: "new session");
    super.initState();
  }

  @override
  void dispose() {
    _otpcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Verify\nEmail',
                style: font,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Text(
                'Enter the 6 digit code which has been sent to your email',
                textAlign: TextAlign.center,
                style: sendCode,
              ),
            ),
            /// here field
            Padding(
              padding: EdgeInsets.only(left: 31, right: 25, top: 25),
              child: SizedBox(
                height: 47,
                child: TextField(
                  controller: _otpcontroller,
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
              padding: EdgeInsets.symmetric(horizontal: 31, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      // shape: ShapeBorder.lerp(Radius.circular(12), 1.1, 1.1),
                      height: 47,
                      elevation: 0,
                      color: Color.fromRGBO(25, 208, 120, 1),
                      onPressed: (){
                        bool result = verifyOTP();
                        if(result) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutYou()));
                        }
                      },
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
/*
Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: OTPTextField(
                    length: 6,
                    // width: MediaQuery.of(context).size.width,
                    width: 330,
                    controller: _otpcontroller,
                    fieldWidth: 40,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Color.fromRGBO(218, 218, 218, 1)
                    ),
                    style: TextStyle(
                        fontSize: 17
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                  ),
                )
              ],
            ),
 */