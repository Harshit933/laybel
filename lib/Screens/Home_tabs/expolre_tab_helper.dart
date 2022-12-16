import 'package:firebase/Screens/profile_screens/search_profile_screen.dart';
import 'package:flutter/material.dart';

class ExploreTabHelper extends StatefulWidget {
  final snap;
  const ExploreTabHelper({Key? key, required this.snap}) : super(key: key);

  @override
  State<ExploreTabHelper> createState() => _ExploreTabHelperState();
}

class _ExploreTabHelperState extends State<ExploreTabHelper> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomProfilePages(snap: widget.snap),
          ),
        );
      },
      child: Container(
        child: Image.network(
          widget.snap['photoUrl'][0],
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
