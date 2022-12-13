import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase/provider/user_provider.dart';
import '../../models/usermodel.dart';

class MyshopPage extends StatefulWidget {
  const MyshopPage({Key? key}) : super(key: key);

  @override
  State<MyshopPage> createState() => _MyshopPageState();
}

class _MyshopPageState extends State<MyshopPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context is only available inside the build widget
    userModel _user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 30),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(157, 62, 216, 1),
                  radius: 54,
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            _user.username.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'Satoshi-bold',
                            ),
                          ),
                          Text(
                            '  ' + _user.pronouns,
                            style: TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.w100,
                              fontFamily: 'Satoshi-regular',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    '45K',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Space-bold',
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Followers',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Space-regular',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    '45K',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Space-bold',
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Space-regular',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    '45K',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Space-bold',
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Sales',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Space-regular',
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 25,
                            color: Color.fromRGBO(157, 62, 216, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 25,
                            color: Color.fromRGBO(157, 62, 216, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 25,
                            color: Color.fromRGBO(157, 62, 216, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 25,
                            color: Color.fromRGBO(157, 62, 216, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 25,
                            color: Color.fromRGBO(157, 62, 216, 1),
                          ),
                          Text(
                            ' (234)',
                            style: TextStyle(
                              fontFamily: 'Space-regular',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 18, right: 18, top: 18),
            child: Text(
              'Hi guys welcome to my store it is one of the most W store love u uwu buy my used clotes u poor ppl bwahhahaha',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Space-regular',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Text(
              'www.instagram.com/user',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromRGBO(157, 62, 216, 1),
                fontFamily: 'Space-regular',
              ),
            ),
          )
        ],
      ),
    );
  }
}
