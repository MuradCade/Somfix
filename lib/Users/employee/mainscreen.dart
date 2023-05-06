import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Employeemainscreen extends StatefulWidget {
  const Employeemainscreen({super.key});

  @override
  State<Employeemainscreen> createState() => _EmployeemainscreenState();
}

class _EmployeemainscreenState extends State<Employeemainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: Text('Welcome Company_Employee'),
        ),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Logout'))
      ]),
    );
  }
}
