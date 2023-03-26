import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:somfixapp/resources/intro-screen.dart';

import 'splashscreen.dart';
import 'mainscreens/login.dart';

int? isviewed;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 600,
        splashTransition: SplashTransition.fadeTransition,
        // duration: 3000,
        splash: SplashScreen(),
        nextScreen: Introscreen(),
        // isviewed != 0 ? OnboardingScreen() : LoginScreen()
      ),
    );
  }
}

// this class contains light and dark mode functionality for dashboard
// class Mainapp extends StatefulWidget {
//   const Mainapp({super.key});

//   @override
//   State<Mainapp> createState() => _MainappState();
// }

// // iconbool used to change  the app theme is light or dark
// bool _iconbool = false;
// // light icon
// IconData _iconlight = Icons.wb_sunny;
// // dark icon
// IconData _icondark = Icons.nights_stay;

// // light theme
// ThemeData _lightTheme =
//     ThemeData(primaryColor: Colors.amber, brightness: Brightness.light);

// // dark theme
// ThemeData _darktheme =
//     ThemeData(primaryColor: Colors.red, brightness: Brightness.dark);

// class _MainappState extends State<Mainapp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //if iconbool is true change to dark theme else change to light theme
//       theme: _iconbool ? _darktheme : _lightTheme,
//       home: Scaffold(
//         // changes the theme from light to dark
//         // appBar: AppBar(
//         //   backgroundColor: Colors.transparent,
//         //   elevation: 0,
//         //   actions: [
//         //     IconButton(
//         //         onPressed: () {
//         //           setState(() {
//         //             _iconbool = !_iconbool;
//         //           });
//         //         },
//         //         icon: Icon(
//         //           _iconbool ? _icondark : _iconlight,
//         //           color: Colors.orange,
//         //         )),
//         //   ],
//         // ),
//         body: OnboardingScreen(),
//       ),
//     );
//   }
// }
