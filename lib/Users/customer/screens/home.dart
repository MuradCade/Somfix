import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:somfixapp/mainscreens/login.dart';
import '../data/displaysinglecompanydetail.dart';
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
      // backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        // automaticallyImplyLeading: true,
        toolbarHeight: 70,

        backgroundColor: Colors.transparent,
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
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    letterSpacing: 1.5),
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
                    borderRadius: BorderRadius.circular(90),
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
                        color: Colors.blue,
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 120.0,
                      child: ListView.builder(
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data!.docs[index];
                          return Card(
                            child: Container(
                              width: 110,
                              height: 84,
                              padding: EdgeInsets.all(2),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          NetworkImage(data['service_image']),
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
                    'Services Providers',
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
              Fetchcompanydata(),
              // ? recomended card service provider (employees)
            ]),
          ),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}

class Fetchcompanydata extends StatefulWidget {
  Fetchcompanydata({super.key});

  @override
  State<Fetchcompanydata> createState() => _FetchcompanydataState();
}

class _FetchcompanydataState extends State<Fetchcompanydata> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('employe').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final result = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(color: Colors.white),
                    // margin: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Displaysignlecompanydetail(
                                        id: result['id'].toString(),
                                        fullname: result['fullname'].toString(),
                                        img: result['profile_image'].toString(),
                                        phone: result['phone'].toString(),
                                        email: result['email'].toString(),
                                        city: result['city'].toString(),
                                        address: result['address'].toString(),
                                        servicetype:
                                            result['servicetype'].toString())));
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Image.network(
                                result['profile_image'],
                              ),
                              title: Text(result['fullname']),
                              subtitle: Text(
                                result['servicetype'],
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
