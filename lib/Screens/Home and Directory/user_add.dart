import 'package:flutter/material.dart';

import '../add_post_screens/screen1.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  // navigating to the new screen asynchronously
  void navigate() async {
    Future.delayed(Duration(milliseconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => addPost()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
