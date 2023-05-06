import 'package:flutter/material.dart';

import '../../customer/screens/notification.dart';
import '../messages.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFffffff),
      appBar: AppBar(
        title: Text('Bookings'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          Messageinbox(),
          MyNotification(),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child: Text('Welcome To  booking screen'),
        ),
      ),
    );
  }
}
