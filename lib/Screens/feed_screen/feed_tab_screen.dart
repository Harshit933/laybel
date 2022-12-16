import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/feed_screen/comments_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:firebase/resources/firestore_methods.dart';
import 'package:provider/provider.dart';
import '../../models/usermodel.dart';
import '../../provider/user_provider.dart';

class FeedTabUI extends StatefulWidget {
  final snap;
  const FeedTabUI({Key? key, required this.snap}) : super(key: key);

  @override
  State<FeedTabUI> createState() => _FeedTabUIState();
}

class _FeedTabUIState extends State<FeedTabUI> {
  late final kingsnap;

  // it will return true if the post is already liked by user and will return false otherwise
  bool checkLikeforAnimation(String uid, List likes) {
    if (widget.snap['likes'].contains(uid)) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    searchKing();
    super.initState();
  }

  Future<void> searchKing() async {
    final king = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.snap['uid'])
        .get() as DocumentSnapshot;

    if (king != null) {
      kingsnap = await king['profilephoto'];
    }
  }

  @override
  Widget build(BuildContext context) {
    userModel user = Provider.of<UserProvider>(context).getUser;

    return Container(
      child: Column(
        children: [
          Row(
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    DocumentSnapshot data = snapshot.data! as DocumentSnapshot;
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
                onTap: () {},
                child: Container(
                  child: Text(
                    '${widget.snap['usernameReal']}',
                    style: headingfont,
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
          Divider(
            color: Color.fromRGBO(157, 62, 216, 1),
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
