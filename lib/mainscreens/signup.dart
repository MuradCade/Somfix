import 'dart:core';
import 'package:flutter/material.dart';
import 'package:somfixapp/data/checklogin.dart';
import 'package:file_picker/file_picker.dart';

import '../data/loginauth.dart';
// import '../resources/button.dart';
// import '../resources/socials-login.dart';
import '../resources/textform.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _result = '-1';
  final List image = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController firstnamecontroller = TextEditingController();
    TextEditingController lastnamenamecontroller = TextEditingController();
    TextEditingController emailnamecontroller = TextEditingController();
    TextEditingController pwdcontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    // instace of class called auth inside login-auth.dart file
    final Authtication auth = Authtication();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
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
                height: 4,
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
                  'By creating an account  you agree  with \n our terms and conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400]),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              // add (upload) image
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 7,
                  )
                ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 14,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          // on this button clicks run this code below
                          FilePickerResult? results =
                              await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg'],
                          );
                          if (results == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No Image Was Selected....'),
                              ),
                            );
                            return null;
                          }

                          final path = results.files.single.path;
                          final filename = results.files.single.name;
                          // print('path' + path.toString());
                          // print('filename' + filename.toString());
                          image.add(path);
                          image.add(filename);
                        },
                        child: Text('Browse...')),
                    SizedBox(width: 14),
                    Text(
                      'Choose Profile Picture',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.8),
                    )
                  ],
                ),
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
                Obsecure: true,
                hintext: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    'Select type of your account',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.info,
                    color: Colors.grey[700],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  width: double.infinity,
                  height: 55,
                  padding: EdgeInsets.only(top: 3, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: DropdownButtonFormField(
                    value: _result,
                    items: [
                      const DropdownMenuItem(
                        child: Text('Personal use'),
                        value: '-1',
                      ),
                      const DropdownMenuItem(
                        child: Text('Company use'),
                        value: "1",
                      ),
                      const DropdownMenuItem(
                        child: Text('Freelancer'),
                        value: "2",
                      )
                    ],
                    onChanged: (value) {
                      _result = value!;
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              // Singup btn
              InkWell(
                onTap: () async {
                  var imgpath = image[0];
                  var imgname = image[1];
                  final imageurl =
                      await auth.uploadProfileimg(imgpath, imgname);

                  String output = await auth.createaccount(
                    firstname: firstnamecontroller.text,
                    lastname: lastnamenamecontroller.text,
                    phone: phonecontroller.text,
                    email: emailnamecontroller.text,
                    password: pwdcontroller.text,
                    role: _result,
                    imageurl: imageurl.toString(),
                  );

                  if (output == 'success') {
                    // print(output);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Checklogin()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        output,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  }
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
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
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
