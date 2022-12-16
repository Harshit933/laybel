import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'expolre_tab_helper.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
          child: SizedBox(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Color.fromRGBO(218, 218, 218, 1),
                hintText: 'Search',
                hintStyle: GoogleFonts.spaceGrotesk(
                  fontSize: 14,
                  color: Color(0xff767676),
                ),
              ),
            ),
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ExploreTabHelper(
                    snap: snapshot.data!.docs[index],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
