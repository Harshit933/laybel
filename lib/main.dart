import 'package:firebase/Auth/toggle_auth_home.dart';
import 'package:firebase/Screens/Home%20and%20Directory/home_page.dart';
import 'package:firebase/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/home': (context) => const HomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          // '/second': (context) => const SecondScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const ToggleScreen(),
      ),
    );
  }
}
