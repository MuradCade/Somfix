import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:somfixapp/Users/company/screens/home.dart';

import '../../mainscreens/login.dart';
import 'screens/account.dart';
import 'screens/booking.dart';
import 'screens/inbox.dart';

class Companymainscreen extends StatefulWidget {
  const Companymainscreen({super.key});

  @override
  State<Companymainscreen> createState() => _CompanymainscreenState();
}

class _CompanymainscreenState extends State<Companymainscreen> {
  //?pages of the userdashboard
  var _pages = [HomeScreen(), BookingScreen(), InboxScreen(), AccountScreen()];

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
      body: SafeArea(
        child: _pages[counter],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFFf1f2f4),
          unselectedItemColor: Color(0xFFF858d95),
          unselectedFontSize: 15,
          selectedItemColor: Color(0xFFF5f60ba),
          selectedFontSize: 15,
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
                  child: Image.asset('assets/home-icon.png',
                      height: 28, color: Color(0xFFF5f60ba)),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset(
                    'assets/booking-icon.png',
                    height: 28,
                  ),
                ),
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset('assets/booking-icon.png',
                      height: 28, color: Color(0xFFF5f60ba)),
                ),
                label: 'Bookings'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  size: 30,
                ),
                label: 'Massages'),
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
                      height: 28, color: Color(0xFFF5f60ba)),
                ),
                label: 'Account'),
          ]),
    );
  }
}
