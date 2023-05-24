import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../mainscreens/login.dart';
import '../../customer/screens/notification.dart';
import '../messages.dart';
import 'profile_allservices.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFffffff),
      appBar: AppBar(
        title: Text('Account'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          Messageinbox(),
          MyNotification(),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(color: Color(0xFFF5f60ba)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4, color: Color(0xFFFffffff)),
                              borderRadius: BorderRadius.circular(150)),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: Image.asset('assets/user.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Murad Cade',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFffffff)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'murad@example.com',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFffffff)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        color: !isSwitched ? Colors.red[50] : Colors.green[50],
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                                width: 8,
                              ),
                              Text(
                                'Available Status',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              !isSwitched
                                  ? Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: Text(
                                        'Your Are Offline',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.red[500],
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: Text(
                                        ' Your Are Online',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green[500],
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Switch(
                                activeColor: Colors.green[500],
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                }),
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      //! edit profile card
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 32,
                                color: Color(0xFFF5f60ba),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 32,
                                color: Color(0xFFFa7a7a7),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[200], thickness: 2),
                      // ! service card (add service)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Createservice()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.grid_view,
                                  size: 32,
                                  color: Color(0xFFF5f60ba),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Services',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 32,
                                  color: Color(0xFFFa7a7a7),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[200], thickness: 2),
                      // ! Payment (setup payment)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.money,
                                size: 32,
                                color: Color(0xFFF5f60ba),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Payment Setup',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 32,
                                color: Color(0xFFFa7a7a7),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[200], thickness: 2),
                      // ! Wallet History
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card,
                                size: 32,
                                color: Color(0xFFF5f60ba),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Wallet History',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 32,
                                color: Color(0xFFFa7a7a7),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[200], thickness: 2),
                      // ! change password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lock,
                                size: 32,
                                color: Color(0xFFF5f60ba),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 32,
                                color: Color(0xFFFa7a7a7),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[200], thickness: 2),
                      // ! about
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_rounded,
                                size: 32,
                                color: Color(0xFFF5f60ba),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'About',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 32,
                                color: Color(0xFFFa7a7a7),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ! logout
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          // specifiy where to go
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFF5f60ba),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ),
                      )
                      // ! version of the app
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
