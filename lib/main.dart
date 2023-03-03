import 'package:flutter/material.dart';
import 'package:somfixapp/onbarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Mainapp(),
    );
  }
}

class Mainapp extends StatefulWidget {
  const Mainapp({super.key});

  @override
  State<Mainapp> createState() => _MainappState();
}

// iconbool used to change  the app theme is light or dark
bool _iconbool = false;
// light icon
IconData _iconlight = Icons.wb_sunny;
// dark icon
IconData _icondark = Icons.nights_stay;

// light theme
ThemeData _lightTheme =
    ThemeData(primaryColor: Colors.amber, brightness: Brightness.light);

// dark theme
ThemeData _darktheme =
    ThemeData(primaryColor: Colors.red, brightness: Brightness.dark);

class _MainappState extends State<Mainapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //if iconbool is true change to dark theme else change to light theme
      theme: _iconbool ? _darktheme : _lightTheme,
      home: Scaffold(
        // changes the theme from light to dark
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           setState(() {
        //             _iconbool = !_iconbool;
        //           });
        //         },
        //         icon: Icon(
        //           _iconbool ? _icondark : _iconlight,
        //           color: Colors.orange,
        //         )),
        //   ],
        // ),
        body: OnboardingScreen(),
      ),
    );
  }
}
