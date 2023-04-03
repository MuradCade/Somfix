import 'package:flutter/material.dart';

import 'forgetpwd.dart';
import 'login.dart';

class EmailSendResponse extends StatelessWidget {
  const EmailSendResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    color: Color(0xFFFF7F5FF),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      )
                    ]),
                child: Icon(
                  Icons.mark_email_read_rounded,
                  color: Color.fromARGB(255, 30, 63, 255),
                  size: 65,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Check your email inbox',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'We have sent password recover\n instruction to your email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.5, color: Colors.grey.shade600, height: 1.5),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1E319D),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Text(
                      'Login Again',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Did not receive the email? Check your spam filter,\n',
                style: TextStyle(fontSize: 14.99),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('or ', style: TextStyle(fontSize: 14.99)),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Forgetpwd()));
                    },
                    child: Text('try another email address',
                        style: TextStyle(
                            fontSize: 14.99,
                            color: Color.fromARGB(255, 30, 63, 255),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
