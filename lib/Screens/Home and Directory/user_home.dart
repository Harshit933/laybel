import 'package:firebase/Screens/Home_tabs/explore_tab.dart';
import 'package:firebase/Screens/Home_tabs/feed_tab.dart';
import 'package:flutter/material.dart';

class HomePageReal extends StatefulWidget {
  const HomePageReal({Key? key}) : super(key: key);

  @override
  State<HomePageReal> createState() => _HomePageRealState();
}

class _HomePageRealState extends State<HomePageReal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(243, 243, 243, 1),
            child: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Space-Bold',
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  text: 'Feed',
                ),
                Tab(
                  text: 'Explore',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              FeedTab(),
              ExploreTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
