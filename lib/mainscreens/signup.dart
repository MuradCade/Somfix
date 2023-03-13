import 'package:flutter/material.dart';

import '../resources/button.dart';
import '../resources/socials-login.dart';
import '../resources/textform.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String errormsg = ' ';

  void displayerrormsg(error) {
    setState(() {
      errormsg = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController firstnamecontroller = TextEditingController();
    TextEditingController lastnamenamecontroller = TextEditingController();
    TextEditingController emailnamecontroller = TextEditingController();
    TextEditingController pwdcontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
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
                  child: Text(
                    'Create Your Account',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF4F4F4F),
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'By Creating Account, you agree to our  \nterms and conditions',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                errormsg,
                style: TextStyle(
                    color: Color(0xFFF4F4F4F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              // Firstname textfield
              TextFormGlobal(
                controller: firstnamecontroller,
                Textinputtype: TextInputType.text,
                Obsecure: false,
                hintext: 'Firstname',
              ),
              SizedBox(
                height: 15,
              ),

              // Lastname Textfield
              TextFormGlobal(
                controller: lastnamenamecontroller,
                Textinputtype: TextInputType.text,
                Obsecure: false,
                hintext: 'Lastname',
              ),
              SizedBox(
                height: 10,
              ),

              // phone number
              TextFormGlobal(
                controller: phonecontroller,
                Textinputtype: TextInputType.number,
                Obsecure: false,
                hintext: 'Phone',
              ),
              SizedBox(
                height: 10,
              ),
              // email textfield
              TextFormGlobal(
                controller: emailnamecontroller,
                Textinputtype: TextInputType.emailAddress,
                Obsecure: false,
                hintext: 'Email',
              ),
              SizedBox(
                height: 10,
              ),

              // pssword textfield
              TextFormGlobal(
                controller: pwdcontroller,
                Textinputtype: TextInputType.emailAddress,
                Obsecure: false,
                hintext: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              // Login btn
              SignupbtnGlobal(
                btntextvalue: 'Signup',
                firstname: firstnamecontroller,
                lastname: lastnamenamecontroller,
                phone: phonecontroller,
                email: emailnamecontroller,
                pwd: pwdcontroller,
              ),

              // social media login
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
