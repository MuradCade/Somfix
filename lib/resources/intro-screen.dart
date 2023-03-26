import 'package:flutter/material.dart';

import '../mainscreens/login.dart';
import '../mainscreens/signup.dart';

class Introscreen extends StatelessWidget {
  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'WELCOME TO SOMFIX',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade900,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Easy, reliable way to take \ncare of your home',
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.grey.shade800,
                      letterSpacing: 2.1,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Container(
              child: Image.asset('assets/intro-screen.jpg'),
            ),
            SizedBox(
              height: 42,
            ),
            // Signup Btn
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2B6173),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            // Login btn
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE7E9EB),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xFFF2B6173),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
