import 'package:firebase/Screens/Home%20and%20Directory/user_add.dart';
import 'package:firebase/Screens/Home%20and%20Directory/user_home.dart';
import 'package:firebase/Screens/Home%20and%20Directory/user_message.dart';
import 'package:firebase/Screens/Home%20and%20Directory/user_notif.dart';
import 'package:firebase/Screens/Home%20and%20Directory/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<dynamic> page = [
    const HomePageReal(),
    const Message(),
    const PostPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage())),

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
          foregroundColor: const Color.fromRGBO(243, 243, 243, 1),
          toolbarHeight: 60,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'appname',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                FeatherIcons.shoppingBag,
                size: 25,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: page[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 50,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(243, 243, 243, 1),
              icon: Icon(
                FeatherIcons.home,
                size: 30,
              ),
              label: '',
              // tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(243, 243, 243, 1),
              icon: Icon(
                FeatherIcons.messageSquare,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(243, 243, 243, 1),
              icon: Icon(
                FeatherIcons.plusCircle,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(243, 243, 243, 1),
              icon: Icon(
                FeatherIcons.heart,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(243, 243, 243, 1),
              icon: Icon(
                FeatherIcons.box,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
