import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../../models/usermodel.dart';
import '../../provider/user_provider.dart';

class ProfilePage extends StatefulWidget {
  final snap;
  const ProfilePage({Key? key, required this.snap}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late DocumentSnapshot data;

  getDetails() {
    var snapshot = FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.snap['uid']) as DocumentSnapshot;
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    userModel _user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xfff3f3f3),
        leading: IconButton(
          icon: Icon(
            FeatherIcons.arrowLeft,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () {
            // _postdeleteprompt(context);
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.snap['usernameReal'],
          style: TextStyle(
            fontFamily: 'Satoshi-bold',
            fontSize: 20,
            color: Color.fromRGBO(157, 62, 216, 1),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 30),
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(widget.snap['uid'])
                  .get(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                DocumentSnapshot data = snapshot.data! as DocumentSnapshot;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          data['profilephoto'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 21,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                data['username'],
                                style: TextStyle(
                                  fontSize: 22,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: 'Satoshi-bold',
                                ),
                              ),
                              Text(
                                data['pronouns'],
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
                );
              }),
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
