import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Const/fonts.dart';
import '../../models/usermodel.dart';
import '../../provider/user_provider.dart';
import 'comment_ui.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController _commentsController = TextEditingController();

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          'Comments',
          style: headingfont,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffF0F0F0),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.snap['postId'])
            .collection('comments')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => CommentUI(
              snap: (snapshot.data as dynamic).docs[index].data(),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(user.profilephoto),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  controller: _commentsController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(218, 218, 218, 1),
                    hintText: 'Comment as ${user.username}',
                    hintStyle: placeholder,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  FirestoreMethods().addComments(
                    widget.snap['postId'],
                    _commentsController.text,
                    user.uid!,
                    user.username,
                  );
                  setState(() {
                    _commentsController.text = "";
                  });
                },
                icon: Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
