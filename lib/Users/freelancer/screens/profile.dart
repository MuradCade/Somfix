import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/freelancer/screens/privacypolicy.dart';

import '../../../mainscreens/login.dart';
import '../messages.dart';
import 'changepassword.dart';
import 'edit_profile.dart';
import 'profile_allservices.dart';
import 'wallet_history.dart';

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
          Container(
            margin: EdgeInsets.only(right: 2),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Messageinbox()));
              },
              icon: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6)),
                child: Icon(
                  Icons.message_outlined,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          )
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
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('employe')
                      .where('id',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  // initialData: initialData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final result = snapshot.data!.docs.reversed.toList();
                      for (var result in result) {
                        return Container(
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
                                        width: 4,
                                        color: Color(0xFFFffffff),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              result['profile_image'])),
                                      borderRadius: BorderRadius.circular(150)),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    // child: Image.asset('assets/user.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                result['fullname'].toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFffffff)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                result['email'].toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFffffff)),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    }
                  },
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Editprofile()));
                            },
                            child: Row(
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
                      //  ! Wallet History
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wallethistory()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.history,
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Changepassword()));
                        },
                        child: Row(
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
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[200], thickness: 2),
                      // ! about
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Privacypolicy()));
                            },
                            child: Row(
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
                                  'Privacy Policy',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ! version of the app
                      Center(
                        child: Text(
                          'V1.0',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
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
