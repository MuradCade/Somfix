import 'package:flutter/material.dart';
import '../resources/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'emailsentresponse.dart';

class Forgetpwd extends StatefulWidget {
  const Forgetpwd({super.key});

  @override
  State<Forgetpwd> createState() => _ForgetpwdState();
}

class _ForgetpwdState extends State<Forgetpwd> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 18),
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 18),
              child: const Text(
                'Enter the email associated with your account\n and we\'ll send email with instructions to \n reset your password.',
                style:
                    TextStyle(fontSize: 17, height: 1.5, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 18),
              child: const Text(
                'Email Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: TextFormGlobal(
                  controller: emailcontroller,
                  hintext: 'Enter Email...',
                  Obsecure: false,
                  Textinputtype: TextInputType.emailAddress),
            ),

            // forgetpwd btn
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                // forget pwd logic
                onTap: () async {
                  if (emailcontroller.text != '') {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailcontroller.text.trim());
                      // if email sendsuccessfully let the user now that email sent
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailSendResponse()));
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          e.message.toString(),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        duration: const Duration(seconds: 1),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Empty Email Field',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: Duration(seconds: 1),
                    ));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1E319D),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: const Text(
                    'Send Email',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
