import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'data/checklogin.dart';
import 'splashscreen.dart';


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
      title: 'Somfix APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 600,
        splashTransition: SplashTransition.fadeTransition,
        // duration: 3000,
        splash: const SplashScreen(),
        nextScreen: const Checklogin(),
        // isviewed != 0 ? OnboardingScreen() : LoginScreen()
      ),
    );
  }
}
