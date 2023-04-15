import 'package:flutter/material.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Wrap(
              spacing: 6.0,
              children: [
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF127EC3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                      child: Text(
                    'Upcoming',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xFFF127EC3),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                      child: Text(
                    'Upcoming',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFF127EC3),
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
