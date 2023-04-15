import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyheaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          // ? edit profile card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 54,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 7,
                    )
                  ]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.person, color: Color(0xFFF127EC3), size: 26),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Edit Profile',
                      style: TextStyle(
                          letterSpacing: 1.8,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF127EC3)))
                ],
              ),
            ),
          ),
          //
          // ? security card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 54,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 7,
                    )
                  ]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.verified_user,
                      color: Color(0xFFF127EC3), size: 26),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Security',
                      style: TextStyle(
                          letterSpacing: 1.8,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF127EC3)))
                ],
              ),
            ),
          ),
          // ? payment card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 54,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 7,
                    )
                  ]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.account_balance_wallet,
                      color: Color(0xFFF127EC3), size: 26),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Payment',
                      style: TextStyle(
                          letterSpacing: 1.8,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF127EC3)))
                ],
              ),
            ),
          ),
          // ?privacy ploicy card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 54,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 7,
                    )
                  ]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.lock, color: Color(0xFFF127EC3), size: 26),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Privacy Policy',
                      style: TextStyle(
                          letterSpacing: 1.8,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF127EC3)))
                ],
              ),
            ),
          ),
          // ? logout button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                // specifiy where to go
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 54,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                      )
                    ]),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.logout, color: Colors.white, size: 26),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Logout',
                        style: TextStyle(
                            letterSpacing: 1.8,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// my drawer header

class MyheaderDrawer extends StatefulWidget {
  MyheaderDrawer({super.key});

  @override
  State<MyheaderDrawer> createState() => _MyheaderDrawerState();
}

class _MyheaderDrawerState extends State<MyheaderDrawer> {
  final curentuser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF127EC3),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: ClipRect(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('userdata')
              .where('id', isEqualTo: curentuser.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue[300],
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];
                  final imgurl =
                      'https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80';
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(data['profile_image'] == ''
                                  ? 'https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'
                                  : data['profile_image']),
                            )),
                      ),
                      Text(
                        data['Firstname'] + ' ' + data['Lastname'],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(data['Email'],
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 16))
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                    'Error Occur While Displaying Data Please Try Again Later...',
                    style: TextStyle(color: Colors.white)),
              );
            }
          },
        ),
      ),
    );
  }
}
