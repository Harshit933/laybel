import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../Const/add_post_util.dart';
import '../Home and Directory/home_page.dart';

class addPost extends StatefulWidget {
  const addPost({Key? key}) : super(key: key);

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  @override
  Widget build(BuildContext context) {
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text(
          'New Listing',
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
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Add photos and videos',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Satoshi-bold',
                  fontSize: 20,
                ),
              ),
            ]),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: AddPhoto(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: AddPhoto(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: AddPhoto(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: AddPhoto(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: AddPhoto(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*

Padding(
                padding: EdgeInsets.only(left: 6, right: 6),
                child: AddPhoto(
                  file: _file,
                  // pressed: _selectImage(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: AddPhoto(
                  file: _file,
                  // pressed: _selectImage(context),
                ),
              ),

 */
