import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Screens/feed_screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Const/fonts.dart';
import '../../models/usermodel.dart';
import '../../provider/user_provider.dart';
import '../../resources/firestore_methods.dart';
import '../feed_screen/comments_screen.dart';

class CustomProfilePages extends StatefulWidget {
  final snap;
  const CustomProfilePages({Key? key, required this.snap}) : super(key: key);

  @override
  State<CustomProfilePages> createState() => _CustomProfilePagesState();
}

class _CustomProfilePagesState extends State<CustomProfilePages> {
  bool checkLikeforAnimation(String uid, List likes) {
    if (widget.snap['likes'].contains(uid)) {
      return true;
    }
    return false;
  }

  /// TODO check the colour of follow button if the user has already followed then it should not be purple instead it should be white
  @override
  Widget build(BuildContext context) {
    userModel user = Provider.of<UserProvider>(context).getUser;
    bool isProfile = false;

    // checkProfile() {
    //   if (user.usernameReal == username) {
    //     return false;
    //   } else {
    //     return true;
    //   }
    // }

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
          'Explore',
          style: TextStyle(
            fontFamily: 'Satoshi-bold',
            fontSize: 20,
            color: Color.fromRGBO(157, 62, 216, 1),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('Users')
                          .doc(widget.snap['uid'])
                          .get(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else {
                          DocumentSnapshot data =
                              snapshot.data! as DocumentSnapshot;
                          return CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.network(
                                data['profilephoto'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              snap: widget.snap,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Text(
                          '${widget.snap['usernameReal']}',
                          style: headingfont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: 90,
                  decoration: ShapeDecoration(
                    color: Color.fromRGBO(157, 62, 216, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 20,
                        cornerSmoothing: 0.6,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Follow',
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color.fromRGBO(217, 217, 217, 1),
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.snap['photoUrl'].length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Image.network(
                    widget.snap['photoUrl'][index],
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  FirestoreMethods firestore = FirestoreMethods();
                  firestore.addLikes(
                    user.uid!,
                    widget.snap['postId'].toString(),
                    widget.snap['likes'],
                  );
                },
                icon: Icon(
                  FeatherIcons.heart,
                  color: checkLikeforAnimation(user.uid!, widget.snap['likes'])
                      ? Colors.red
                      : Colors.black,
                ),
              ),
              SizedBox(
                width: 1,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        snap: widget.snap,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  FeatherIcons.messageSquare,
                ),
              ),
              SizedBox(
                width: 1,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.arrowRight,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 4),
            child: Row(
              children: [
                Text(
                  '${widget.snap['likes'].length} likes',
                  style: likesfont,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    text: TextSpan(
                      text: '${widget.snap['usernameReal']} ',
                      style: profilefont,
                      children: [
                        TextSpan(
                          text: widget.snap['Description'],
                          style: containerfont,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      text: 'Brand : ',
                      style: profilefont,
                      children: [
                        TextSpan(
                            text: '${widget.snap['brand']}',
                            style: containerfont)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      text: 'Size : ',
                      style: profilefont,
                      children: [
                        TextSpan(
                          text: widget.snap['Sizes'].toString(),
                          style: containerfont,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      text: 'Price : ',
                      style: profilefont,
                      children: [
                        TextSpan(
                            text: widget.snap['prize'], style: containerfont)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      text: DateFormat.yMMMd().format(
                        widget.snap['datePublished'].toDate(),
                      ),
                      style: profilefont,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
