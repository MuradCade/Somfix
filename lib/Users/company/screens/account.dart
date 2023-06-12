import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../mainscreens/login.dart';
import 'change_password.dart';
import 'create_service.dart';
import 'edit-profile.dart';
import 'wallet_history.dart';
// import 'update_service.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final currentuserid = FirebaseAuth.instance.currentUser?.uid;
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('company')
                        .where('id', isEqualTo: currentuserid.toString())
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final result = snapshot.data!.docs.reversed.toList();
                        for (var result in result) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 290,
                                decoration: BoxDecoration(
                                  color: Colors.indigo[600],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            result['company_logo']),
                                        // backgroundColor: Colors.white,
                                        radius: 60,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      result['company_name'],
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      result['email'],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
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
                                      color: !isSwitched
                                          ? Colors.red[50]
                                          : Colors.green[50],
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    margin: EdgeInsets.only(
                                                        right: 12),
                                                    child: Text(
                                                      'Your Are Offline',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colors.red[500],
                                                          letterSpacing: 1.5,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  )
                                                : Container(
                                                    margin: EdgeInsets.only(
                                                        right: 12),
                                                    child: Text(
                                                      ' Your Are Online',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colors.green[500],
                                                          letterSpacing: 1.5,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: Colors.indigo,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Editprofile()));
                                          },
                                          child: const Text(
                                            'Edit Profile',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Createservice()));
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.apps_rounded,
                                            color: Colors.indigo,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'Service',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.lock,
                                          color: Colors.indigo,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Changepassword()));
                                          },
                                          child: const Text(
                                            'Change Password',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 18,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.history,
                                          color: Colors.indigo,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Wallethistory()));
                                          },
                                          child: const Text(
                                            'Wallet History',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 19,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                                    },
                                    child: const Text(
                                      'Logout',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'V1.0',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }
                        return Container();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
