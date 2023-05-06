import 'dart:core';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../data/checklogin.dart';
import '../data/personalaccountAuth.dart';
import '../resources/textform.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String gender = '-1';
  final List image = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnamecontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController agecontroller = TextEditingController();
    TextEditingController countrycountroller = TextEditingController();
    TextEditingController citycountroller = TextEditingController();
    TextEditingController addresscontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController pwdcontroller = TextEditingController();
    final Authtication auth = Authtication();
    var imgpath;
    var imgname;

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
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create Personal Account',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF4F4F4F),
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 20,
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
                controller: fullnamecontroller,
                Textinputtype: TextInputType.text,
                Obsecure: false,
                hintext: 'Fullname',
              ),
              SizedBox(
                height: 15,
              ),
              // phine number
              TextFormGlobal(
                controller: phonecontroller,
                Textinputtype: TextInputType.number,
                Obsecure: false,
                hintext: 'Phone',
              ),
              SizedBox(
                height: 10,
              ),

              // age number
              TextFormGlobal(
                controller: agecontroller,
                Textinputtype: TextInputType.number,
                Obsecure: false,
                hintext: 'Age',
              ),
              SizedBox(
                height: 10,
              ),
              //gender
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
                    value: gender,
                    items: [
                      const DropdownMenuItem(
                        child: Text('Select gender'),
                        value: "-1",
                      ),
                      const DropdownMenuItem(
                        child: Text('Male'),
                        value: "1",
                      ),
                      const DropdownMenuItem(
                        child: Text('Female'),
                        value: "2",
                      ),
                    ],
                    onChanged: (value) {
                      gender = value!;
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // country
              TextFormGlobal(
                controller: countrycountroller,
                Textinputtype: TextInputType.text,
                Obsecure: false,
                hintext: 'Country',
              ),
              SizedBox(
                height: 10,
              ),
              // city
              TextFormGlobal(
                controller: citycountroller,
                Textinputtype: TextInputType.text,
                Obsecure: false,
                hintext: 'City',
              ),
              SizedBox(
                height: 10,
              ),
              // address
              TextFormGlobal(
                controller: addresscontroller,
                Textinputtype: TextInputType.text,
                Obsecure: false,
                hintext: 'Address',
              ),
              SizedBox(
                height: 10,
              ),
              // email textfield
              TextFormGlobal(
                controller: emailcontroller,
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
                height: 15,
              ),
              // Singup btn
              InkWell(
                onTap: () async {
                  if (image.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Please select profile image",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else {
                    imgpath = image[0];
                    imgname = image[1];
                    final imgurl = await auth.uploadProfileimg(
                        imgpath.toString(), imgname.toString());
                    String output = await auth.createpersonalaccount(
                        img: imgurl.toString(),
                        fullname: fullnamecontroller.text,
                        phone: phonecontroller.text,
                        age: agecontroller.text,
                        gender: gender,
                        country: countrycountroller.text,
                        city: citycountroller.text,
                        address: addresscontroller.text,
                        email: emailcontroller.text,
                        pwd: pwdcontroller.text);

                    // check the return of the function
                    if (output == 'success') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checklogin()));
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
                    'Singup',
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
