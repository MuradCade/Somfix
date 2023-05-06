// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/freelancer/screens/booking.dart';
import 'package:somfixapp/Users/freelancer/screens/dashboard.dart';
import 'package:somfixapp/Users/freelancer/screens/payment.dart';
import 'package:somfixapp/Users/freelancer/screens/profile.dart';
// import 'package:somfixapp/mainscreens/login.dart';

class Freelancer extends StatefulWidget {
  Freelancer({super.key});

  @override
  State<Freelancer> createState() => _FreelancerState();
}

class _FreelancerState extends State<Freelancer> {
  //?pages of the userdashboard
  var _pages = [
    Homescreen(),
    Bookingscreen(),
    Paymentscreen(),
    Profilescreen()
  ];

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
      // bottom navigation
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
                icon: Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Image.asset(
                    'assets/payment-icon.png',
                    height: 28,
                  ),
                ),
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.asset('assets/payment-icon.png',
                      height: 28, color: Color(0xFFF5f60ba)),
                ),
                label: 'Payments'),
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
