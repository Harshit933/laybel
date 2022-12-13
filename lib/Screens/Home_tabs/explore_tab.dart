import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: SizedBox(
            // height: 47,
            // width: 328,
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
        Padding(
          padding: EdgeInsets.fromLTRB(2, 18, 2, 2),
          child: Row(
            children: [
              Container(
                // padding: EdgeInsets.fromLTRB(2, 18, 2, 2),
                height: 121,
                width: 121,
                color: Colors.grey,
              ),
              SizedBox(
                width: 2,
              ),
              Container(
                height: 121,
                width: 121,
                color: Colors.grey,
              ),
              SizedBox(
                width: 2,
              ),
              Container(
                height: 121,
                width: 121,
                color: Colors.grey,
              ),
            ],
          ),
        )
      ],
    );
  }
}
