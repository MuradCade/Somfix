import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'created_service_detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
  final uemail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                'Welcome To Employee Dashboard',
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
                            'Provider Type: ',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 17,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ' Employee',
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
                                          .collection("bookedservices")
                                          .where('assignedtoemail',
                                              isEqualTo: FirebaseAuth
                                                  .instance.currentUser!.email)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
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
                                              ));
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
                                          .collection("payment")
                                          .where('service_provider',
                                              isEqualTo: 'deep@cleaning.com')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
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
                                                      result['total_amount']
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white),
                                                ));
                                          }
                                        }
                                        return Container();
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
                  // ! card 4
                ],
              ),
              const SizedBox(
                height: 38,
              ),

              Text(
                'Assigned Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bookedservices')
                    .where('assignedtoemail', isEqualTo: uemail)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.data!.docs.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Center(
                          child: Text(
                            'There are no services to be displayed',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final result = snapshot.data!.docs[index];
                            // final id = snapshot.data!.docs[index].id;

                            return result['servicestatus'] == 'Verified'
                                ? Container()
                                : Padding(
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
                                                              assignedtoemail:
                                                                  result['assignedtoemail']
                                                                      .toString(),
                                                            )));
                                              },
                                              child: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            result[
                                                                'service_img']),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      width: 110,
                                                      height: 34,
                                                      decoration: BoxDecoration(
                                                          color: Colors.indigo,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Center(
                                                        child: Text(
                                                          '\$' +
                                                              result['price']
                                                                  .toString(),
                                                          // result[
                                                          // 'Service_category'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              letterSpacing:
                                                                  1.2,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
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
                                                result['service_name'],
                                                // result['Service_name'],
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),

                                              subtitle: Text(
                                                // result['Service_description'],
                                                result['description'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
