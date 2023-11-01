import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/Screens/Home%20and%20Directory/home_page.dart';
import 'package:provider/provider.dart';
import '../Screens/SigninandLogIn/all_logins.dart';
import '../provider/user_provider.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  @override
  void initState() {
    addData();
    super.initState();
  }

  Future<void> addData() async {
    UserProvider userprovider = Provider.of(context, listen: false);
    await userprovider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const startPage();
          }
        },
      ),
    );
  }
}
