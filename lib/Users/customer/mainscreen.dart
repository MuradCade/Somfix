import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:somfixapp/mainscreens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Customermainscreen extends StatefulWidget {
  const Customermainscreen({super.key});

  @override
  State<Customermainscreen> createState() => _CustomermainscreenState();
}

class _CustomermainscreenState extends State<Customermainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Center(
            child: Text('Welcome Customer'),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              GoogleSignIn().signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(color: Colors.blue[500]),
                child: Center(
                    child: Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
