import 'package:flutter/material.dart';
import 'package:somfixapp/mainscreens/signup.dart';

import '../resources/button.dart';
import '../resources/socials-login.dart';
import '../resources/textform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/somfix-logo.png',
                    height: 140,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Login to your Account',
                style: TextStyle(
                    color: Color(0xFFF4F4F4F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 15,
              ),
              // Email textfield
              TextFormGlobal(
                controller: emailcontroller,
                Textinputtype: TextInputType.emailAddress,
                Obsecure: false,
                hintext: 'Email',
              ),
              SizedBox(
                height: 15,
              ),

              // Password Textfield
              TextFormGlobal(
                controller: pwdcontroler,
                Textinputtype: TextInputType.text,
                Obsecure: true,
                hintext: 'Password',
              ),
              SizedBox(
                height: 10,
              ),

              // Login btn
              LoginbtnGlobal(btntextvalue: 'Login'),

              // social media login
              SizedBox(
                height: 20,
              ),
              ScialmediaGlobal(),
              // forget password
            ],
          ),
        ),
      )),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Don\'t have an account yet!',
            style: TextStyle(fontSize: 15, color: Color(0xFFF4F4F4F)),
          ),
          SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            child: Text(
              'Create Account',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFF1E319D),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
