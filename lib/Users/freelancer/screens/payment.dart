import 'package:flutter/material.dart';

import '../../customer/screens/notification.dart';
import '../messages.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFffffff),
      appBar: AppBar(
        title: Text('Payments'),
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
          child: Text('Welcome To Payment screen'),
        ),
      ),
    );
  }
}
