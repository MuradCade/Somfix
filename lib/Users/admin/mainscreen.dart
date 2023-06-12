import 'package:flutter/material.dart';

class Adminmainscreen extends StatefulWidget {
  const Adminmainscreen({super.key});

  @override
  State<Adminmainscreen> createState() => _AdminmainscreenState();
}

class _AdminmainscreenState extends State<Adminmainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        Center(
          child: Text('Welcome Admin'),
        ),
        InkWell(
          child: Text('LOGOUT'),
        )
      ]),
    );
  }
}
