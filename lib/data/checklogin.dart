import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:somfixapp/mainscreens/login.dart';
import 'package:somfixapp/resources/intro-screen.dart';

import '../Users/admin/mainscreen.dart';
import '../Users/company/mainscreen.dart';
import '../Users/customer/mainscreen.dart';
import '../Users/employee/mainscreen.dart';

class Checklogin extends StatefulWidget {
  const Checklogin({super.key});

  @override
  State<Checklogin> createState() => _CheckloginState();
}

class _CheckloginState extends State<Checklogin> {
  var auth = FirebaseAuth.instance;

  final authchange = FirebaseAuth.instance.authStateChanges();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: authchange,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow,
                ),
              );
            } else if (snapshot.hasData) {
              return Logout();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  var username = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('userdata')
                .where('Email', isEqualTo: username)
                .snapshots(),
            builder: (context, snapshot) {
              // List<String> clientwidgets = [];
              if (snapshot.hasData) {
                final clients = snapshot.data?.docs.reversed.toList();
                final useremail = FirebaseAuth.instance.currentUser?.email;
                for (var clients in clients!) {
                  //   // final clientwidget = Row(
                  //   //   children: [
                  //   //     clienr),
                  //   //   ],
                  if (clients['role'] == 'admin') {
                    // print('welcome admin');
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Adminmainscreen())));
                  } else if (clients['role'] == 'company') {
                    // print('welcome company');
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Companymainscreen())));
                  } else if (clients['role'] == 'freelancer') {
                    // print('welcome employee');
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Employeemainscreen())));
                  } else if (clients['role'] == 'personal') {
                    // print('welcome customer');
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Customermainscreen())));
                  } else {
                    // print('no role was fetched');
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen())));
                  }
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.yellow,
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                ),
              );
              ;
            },
          ),
        ],
      ),
    ));
  }
}
