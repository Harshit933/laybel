import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_post_screens/screen1.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
  }

  // navigating to the new screen asynchronously

  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => addPost()));
              },
              child: Container(
                height: 49,
                width: 297,
                decoration: ShapeDecoration(
                  color: Color.fromRGBO(157, 62, 216, 1),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.6,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Create a new Post',
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
            SizedBox(
              height: 5,
            ),
            Container(
              height: 49,
              width: 297,
              decoration: ShapeDecoration(
                color: Color.fromRGBO(157, 62, 216, 1),
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 10,
                    cornerSmoothing: 0.6,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Add from drafts',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xfff3f3f3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
