import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../mainscreens/login.dart';

class Companymainscreen extends StatefulWidget {
  const Companymainscreen({super.key});

  @override
  State<Companymainscreen> createState() => _CompanymainscreenState();
}

class _CompanymainscreenState extends State<Companymainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('Welcome To  Company Account'),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Logout'))
        ],
      )),
    );
  }
}
