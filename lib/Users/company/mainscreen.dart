import 'package:flutter/material.dart';

class Companymainscreen extends StatefulWidget {
  const Companymainscreen({super.key});

  @override
  State<Companymainscreen> createState() => _CompanymainscreenState();
}

class _CompanymainscreenState extends State<Companymainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: Text('Welcome Company'),
        ),
        InkWell(
          child: Text('LOGOUT'),
        )
      ]),
    );
  }
}
