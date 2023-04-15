import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../mainscreens/login.dart';
import 'drawer.dart';
import 'notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        title: Center(
          child: Image.asset(
            'assets/white-logo.png',
            height: 30,
          ),
        ),
        backgroundColor: Color(0xFFF127EC3),
        elevation: 0,
        actions: [
          MyNotification(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 14,
              ),
              Text(
                'What service do you need?',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 4, left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ),
                    hintText: "Search Here...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service Category',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    child: Text(
                      'View More',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFF127EC3),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('servicecategory')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 120.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data!.docs[index];
                          return Card(
                            child: Container(
                              width: 110,
                              height: 84,
                              padding: EdgeInsets.all(2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: NetworkImage(data['service_image']),
                                    height: 45,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    data['servicename'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recomended',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFF127EC3),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              // ? recomended card service provider (employees)
              Container(
                padding: EdgeInsets.all(4),
                width: double.infinity,
                height: 290,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 14),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      // color: Colsors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 6),
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          width: double.infinity,
                          color: Colors.blue[100],
                          child:
                              Image.asset('assets/emp.jpg', fit: BoxFit.cover),
                        )),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Person Name',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Short Description Of The Person',
                                style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                    letterSpacing: 1.1,
                                    color: Colors.grey.shade700),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price \$25',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_circle_right,
                                      size: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
