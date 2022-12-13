import 'package:firebase/Screens/Profile_Tabs/orders.dart';
import 'package:firebase/Screens/Profile_Tabs/reviews.dart';
import 'package:firebase/Screens/Profile_Tabs/saved.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/user_provider.dart';
import '../Profile_Tabs/my_shopp.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    addData();
    super.initState();
  }

  void addData() async {
    UserProvider _provider = Provider.of(context, listen: false);
    await _provider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    // userModel _user = Provider.of<UserProvider>(context).getUser;

    return DefaultTabController(
      length: 4,
      child: SafeArea(
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
                  fontSize: 15,
                ),
                tabs: [
                  const Tab(
                    text: 'My Shop',
                  ),
                  const Tab(
                    text: 'Saved',
                  ),
                  const Tab(
                    text: 'Orders',
                  ),
                  const Tab(
                    text: 'Reviews',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const MyshopPage(),
                  const SavedPage(),
                  const OrdersPage(),
                  const ReviewsPage(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
