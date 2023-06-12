import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:somfixapp/Users/customer/screens/home.dart';
import 'package:somfixapp/Users/customer/screens/inbox.dart';
import 'package:somfixapp/Users/customer/screens/mybooking.dart';
import 'package:somfixapp/Users/customer/screens/profile.dart';
import 'package:somfixapp/mainscreens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Customermainscreen extends StatefulWidget {
  const Customermainscreen({super.key});

  @override
  State<Customermainscreen> createState() => _CustomermainscreenState();
}

class _CustomermainscreenState extends State<Customermainscreen> {
  //?pages of the userdashboard
  var _pages = [Home(), MyBooking(), Inbox(), Profile()];

  int counter = 0;
  //  navigation state increases the counter value depend on the page
  void _navigation(int index) {
    setState(() {
      counter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[counter],
      // bottom navigation
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: counter,
          onTap: _navigation,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  // padding: EdgeInsets.only(bottom: 6),
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset(
                    'assets/home-icon.png',
                    height: 32,
                  ),
                ),
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset('assets/home.png',
                      height: 28, color: Colors.blue),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(bottom: 2),
                    child: Image.asset(
                      'assets/booking-icon.png',
                      height: 28,
                    )),
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset('assets/booking-icon.png',
                      height: 28, color: Colors.blue),
                ),
                label: 'My Booking'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Image.asset(
                    'assets/messenger.png',
                    height: 28,
                  ),
                ),
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset('assets/messenger.png',
                      height: 28, color: Colors.blue),
                ),
                label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Image.asset(
                    'assets/profile-icon.png',
                    height: 28,
                  ),
                ),
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset('assets/profile-icon.png',
                      height: 28, color: Colors.blue),
                ),
                label: 'Profile'),
          ]),
    );
  }
}
