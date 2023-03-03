import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:somfixapp/onboarding_screens/screen1.dart';
import 'package:somfixapp/onboarding_screens/screen2.dart';
import 'package:somfixapp/onboarding_screens/screen3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // lastpage check
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
                  _controller.jumpToPage(2);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400]),
                ),
              ),

              SmoothPageIndicator(controller: _controller, count: 3),

              // onlastpage bool variable if true display done text else displays next text
              onlastpage
                  ? GestureDetector(
                      onTap: () {
                        // navigator should go to login or singup page
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo[500]),
                      ),
                    )
                  // next text

                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo[500]),
                      ),
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
