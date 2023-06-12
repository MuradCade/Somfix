import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../mainscreens/login.dart';
import '../data/change_password_class.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  Changepasswords changepwd = Changepasswords();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New Password',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Your new password must be different  \n from previous used password.',
                style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 1.2,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade900),
              ),
              const SizedBox(
                height: 30,
              ),
              // password feild
              Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                padding: EdgeInsets.only(top: 3, left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                      )
                    ]),
                child: TextFormField(
                  controller: newpasswordcontroller,
                  // keyboardType: ,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: TextStyle(height: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Must be at least 8 characters',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                padding: EdgeInsets.only(top: 3, left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                      )
                    ]),
                child: TextFormField(
                  controller: confirmpasswordcontroller,
                  // keyboardType: ,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Repeat Password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: TextStyle(height: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' Both Passwords must match',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              InkWell(
                onTap: () async {
                  if (newpasswordcontroller.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Empty Password Field',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (confirmpasswordcontroller.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Empty Confirm Password Field',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (newpasswordcontroller.text !=
                      confirmpasswordcontroller.text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Passwords Don't Match",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else {
                    String output = await changepwd.changesingleuserpassword(
                        newpassword: newpasswordcontroller.text);
                    if (output == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Password has been changed... Login again?",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        duration: const Duration(seconds: 1),
                      ));
                      FirebaseAuth.instance.signOut();
                      // specifiy where to go
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          output.toString(),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        duration: const Duration(seconds: 1),
                      ));
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
