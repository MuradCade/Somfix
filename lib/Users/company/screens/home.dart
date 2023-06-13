import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/company/screens/service_detailscreen.dart';

import '../../freelancer/screens/chatscreen.dart';
import 'create_service.dart';
import 'notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var date = DateTime.now();
  // associative array daysofthe week
  var daysoftheweek = {
    "1": "Monday ",
    '2': 'Tuesday ',
    '3': 'Wednesday ',
    '4': 'Thursday ',
    '5': 'Friday',
    '6': 'Saturday',
    '7': 'Sunday'
  };
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
              child: Container(
                width: 40,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Icon(
                  Icons.notifications,
                  color: Colors.indigo,
                )),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Welcome To Company Dashboard',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFF2f3034),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 24,
                ),
                Card(
                  color: Color(0xFFFf2f2f2),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Account Type: ',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              ' Company',
                              style: TextStyle(
                                  color: Color(0xFFF2f3034),
                                  fontSize: 17,
                                  letterSpacing: 1.4,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Current Day: ',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              daysoftheweek['${date.weekday}'].toString(),
                              style: TextStyle(
                                  color: Color(0xFFF2f3034),
                                  fontSize: 17,
                                  letterSpacing: 1.4,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //? cards , total booking ,services etc
                Wrap(
                  spacing: 4.0,
                  runSpacing: 4.0,
                  children: [
                    // ! card 1
                    Card(
                      child: Column(
                        children: [
                          Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFFF5f60ba),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('bookedservices')
                                            .where('provideremail',
                                                isEqualTo: user!.email)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            if (snapshot.data!.docs.isEmpty) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                child: Text(
                                                  snapshot.data!.docs.length
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 12, top: 18),
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Card(
                                            color: Colors.white,
                                            child: Icon(
                                              Icons.ac_unit_rounded,
                                              size: 22,
                                              color: Color(0xFFF5f60ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, right: 38),
                                    child: Text(
                                      'Total Booking',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // ! card 2
                    Card(
                      child: Column(
                        children: [
                          Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFFF5f60ba),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('service')
                                            .where('person_created_service',
                                                isEqualTo: user!.email)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            if (snapshot.data!.docs.isEmpty) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                child: Text(
                                                  snapshot.data!.docs.length
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 12, top: 18),
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Card(
                                            color: Colors.white,
                                            child: Icon(
                                              Icons.article,
                                              size: 22,
                                              color: Color(0xFFF5f60ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, right: 38),
                                    child: Text(
                                      'Total Service',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // ! card 3
                    Card(
                      child: Column(
                        children: [
                          Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFFF5f60ba),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('payment')
                                            .where('service_provider',
                                                isEqualTo: user!.email)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            if (snapshot.data!.docs.isEmpty) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white),
                                                ),
                                              );
                                            } else {
                                              final result = snapshot
                                                  .data!.docs.reversed
                                                  .toList();
                                              for (var result in result) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      left: 12, top: 18),
                                                  child: Text(
                                                    '\$' +
                                                        int.parse(result[
                                                                'total_amount'])
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }
                                              return Container();
                                            }
                                          }
                                        },
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 12, top: 18),
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Card(
                                            color: Colors.white,
                                            child: Icon(
                                              Icons.payment,
                                              size: 22,
                                              color: Color(0xFFF5f60ba),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, right: 38),
                                    child: Text(
                                      'Total Earning',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          'My Services',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )),
                    InkWell(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Createservice()));
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFFF5f60ba),
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),

                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('service')
                      .where('person_created_service', isEqualTo: user?.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.data!.docs.length < 1) {
                        return Center(
                          child: Text('Please Create Service To Be Displayed'),
                        );
                      } else {
                        return SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final result = snapshot.data!.docs[index];
                              final id = snapshot.data!.docs[index].id;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Createdservicedetailscreen(
                                                          id: id.toString(),
                                                          image: result[
                                                              'Service_image'],
                                                          category: result[
                                                              'Service_category'],
                                                          servicename: result[
                                                              'Service_name'],
                                                          price: result['Service_price']
                                                                      .toString() ==
                                                                  ''
                                                              ? '0'
                                                              : result[
                                                                      'Service_price']
                                                                  .toString(),
                                                          description: result[
                                                              'Service_description'],
                                                          duration: result[
                                                              'Service_duration'],
                                                          serviceaddress: result[
                                                              'Service_address'],
                                                          servicestatus: result[
                                                              'Service_status'],
                                                          servicetype: result[
                                                              'Service_type'],
                                                          discount: result[
                                                                          'Service_discount']
                                                                      .toString() ==
                                                                  ''
                                                              ? '0'
                                                              : result[
                                                                      'Service_discount']
                                                                  .toString(),
                                                        )));
                                          },
                                          child: Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(result[
                                                        'Service_image']),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  width: 110,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                    child: Text(
                                                      result[
                                                          'Service_category'],
                                                      // result[
                                                      // 'Service_category'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          letterSpacing: 1.2,
                                                          color: Colors.indigo,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          // mainAxisSize: MainAxisSize.min,
                                          title: Text(
                                            result['Service_name'],
                                            // result['Service_name'],
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),

                                          subtitle: Text(
                                            // result['Service_description'],
                                            result['Service_description'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),

                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          'Employee',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )),
                    InkWell(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Createservice()));
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFFF5f60ba),
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('employe')
                      .where('company_associated', isEqualTo: user?.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.data!.docs.length < 1) {
                        return Center(
                          child:
                              Text('Please Create Employees To Be Displayed'),
                        );
                      } else {
                        return SizedBox(
                          height: 390,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final result = snapshot.data!.docs[index];
                              final id = snapshot.data!.docs[index].id;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(result[
                                                        'profile_image']),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  width: 110,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                    child: Text(
                                                      result['service_type'],
                                                      // result[
                                                      // 'Service_category'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          letterSpacing: 1.2,
                                                          color: Colors.indigo,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          // mainAxisSize: MainAxisSize.min,
                                          title: Text(
                                            result['fullname'],
                                            // result['Service_name'],
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),

                                          subtitle: Text(
                                            // result['Service_description'],
                                            result['email'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Container(
                                                width: 100,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.indigo[600],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Chatscreen(
                                                                      customerid:
                                                                          result[
                                                                              'email'],
                                                                      customername:
                                                                          result[
                                                                              'fullname'],
                                                                    )));
                                                  },
                                                  child: Icon(
                                                    Icons.message,
                                                    color: Colors.white,
                                                    size: 26,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Container(
                                                width: 100,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.indigo[400],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Colors.white,
                                                  size: 26,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
