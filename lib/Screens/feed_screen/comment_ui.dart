import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:flutter/material.dart';

class CommentUI extends StatefulWidget {
  final snap;
  const CommentUI({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentUI> createState() => _CommentUIState();
}

class _CommentUIState extends State<CommentUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('Users')
                .doc(widget.snap['uid'])
                .get(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  strokeWidth: 2,
                );
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
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.snap['username'] + " ",
                    style: profilefont,
                  ),
                  TextSpan(
                    text: widget.snap['comment'],
                    style: containerfont,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
