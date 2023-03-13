import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:somfixapp/onboarding_screens/screen1.dart';
import 'package:somfixapp/onboarding_screens/screen2.dart';
import 'package:somfixapp/onboarding_screens/screen3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainscreens/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  _StoreOnBoard() async {
    int isviewed = 0;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('onboard', isviewed);
    // print(isviewed);
  } // lastpage check

  bool onlastpage = false;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onlastpage = (index == 2);
            });
          },
          children: [ScreenOne(), ScreenTwo(), ScreenThree()],
        ),
        Container(
          alignment: Alignment(
            0,
            0.9,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip text
              GestureDetector(
                onTap: () {
                  _StoreOnBoard();
                  _controller.jumpToPage(2);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo[500]),
                ),
              ),

              SmoothPageIndicator(controller: _controller, count: 3),

              // onlastpage bool variable if true display done text else displays next text
              onlastpage
                  ? GestureDetector(
                      onTap: () {
                        _StoreOnBoard();
                        // navigator should go to login or singup page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    )

                  // next text
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 11),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )),
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
