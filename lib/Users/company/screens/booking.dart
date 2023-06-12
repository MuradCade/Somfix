import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/company/screens/re_assign_service.dart';

import '../data/update_booked_status.dart';
import 'assign_service_to_employee.dart';
import 'booked_details.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String assineddropdown = '-1';
  final currentuseremail = FirebaseAuth.instance.currentUser!.email;
  Bookedservice updatebookedstatus = Bookedservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('bookedservices')
                      .where('provideremail',
                          isEqualTo: currentuseremail.toString())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final collectionid = snapshot.data!.docs[index].id;
                            final result = snapshot.data!.docs[index];
                            // print(collectionid);
                            // print(result['provideremail']);
                            // print(result['assignstatus']);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Bookeddetails(
                                                    provideremail:
                                                        result['provideremail']
                                                            .toString(),
                                                  )));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: result['servicestatus'] ==
                                                  'Pending' ||
                                              result['assignstatus'] == 'false'
                                          ? 390
                                          : result['assignstatus'] == 'true'
                                              ? 390
                                              : 320,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFf4f4f4),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .indigo[200],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  result[
                                                                      'service_img']),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 110,
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                              color: result['servicestatus'] == 'Pending'
                                                                  ? Colors.red[50]
                                                                  : result['servicestatus'] == 'Cancelled'
                                                                      ? Colors.red[50]
                                                                      : result['servicestatus'] == 'Completed'
                                                                          ? Colors.green[50]
                                                                          : result['servicestatus'] == 'Accepted'
                                                                              ? Colors.green[50]
                                                                              : result['servicestatus'] == 'Verified'
                                                                                  ? Colors.green[50]
                                                                                  : result['servicestatus'] == 'Assigned'
                                                                                      ? Colors.green[50]
                                                                                      : result['servicestatus'] == 'Re-Assigned'
                                                                                          ? Colors.green[50]
                                                                                          : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(16)),
                                                          child: Center(
                                                            child: Text(
                                                              result[
                                                                  'servicestatus'],
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: result[
                                                                            'servicestatus'] ==
                                                                        'Pending'
                                                                    ? Colors.red[
                                                                        600]
                                                                    : result['servicestatus'] ==
                                                                            'Cancelled'
                                                                        ? Colors.red[
                                                                            600]
                                                                        : result['servicestatus'] ==
                                                                                'Completed'
                                                                            ? Colors.green[600]
                                                                            : result['servicestatus'] == 'Accepted'
                                                                                ? Colors.green[600]
                                                                                : result['servicestatus'] == 'Verified'
                                                                                    ? Colors.green[600]
                                                                                    : result['servicestatus'] == 'Assigned'
                                                                                        ? Colors.green[600]
                                                                                        : result['servicestatus'] == 'Re-Assigned'
                                                                                            ? Colors.green[600]
                                                                                            : Colors.transparent,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 42,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            '#' +
                                                                result['service_id']
                                                                    .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .indigo,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      result['service_name'],
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      '\$' +
                                                          result['price']
                                                              .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo),
                                                    ),
                                                  ],
                                                ),
                                                Container()
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo[50]),
                                            child: Column(children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(14.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Date & Time',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      result['date']
                                                              .toString() +
                                                          ' At ' +
                                                          result['time']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.indigo,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(14.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Address',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      result['address']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.indigo,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(14.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Amount',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '\$' +
                                                          result['totalamount']
                                                              .toString(),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.indigo,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                          result['servicestatus'] == 'Pending'
                                              ? Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          final output = await updatebookedstatus
                                                              .updateservicedata(
                                                                  collectionid:
                                                                      collectionid,
                                                                  status:
                                                                      'Accepted');

                                                          if (output ==
                                                              'success') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                'Status Updated For Booked Service',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                output,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                          }
                                                          // print('working');
                                                        },
                                                        child: Container(
                                                          width: 120,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .indigo[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                              'Accept',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 19),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          final output = await updatebookedstatus
                                                              .updateservicedata(
                                                                  collectionid:
                                                                      collectionid
                                                                          .toString(),
                                                                  status:
                                                                      'Cancelled');

                                                          if (output ==
                                                              'success') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                'Status Updated For Booked Service',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                output,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 120,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .red[100],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                              'Decline',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Colors
                                                                      .red[600],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : result['assignstatus'] ==
                                                      'false'
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      AssignBookedservice(
                                                                          collection_id:
                                                                              collectionid.toString())));
                                                        },
                                                        child: Container(
                                                          width: 300,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.indigo,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          child: Center(
                                                              child: Text(
                                                            'Assign This Service',
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      ),
                                                    )
                                                  : result['assignstatus'] ==
                                                          'true'
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14.0),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ReAssignBookedservice(
                                                                              collection_id: collectionid.toString())));
                                                            },
                                                            child: Container(
                                                              width: 300,
                                                              height: 70,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .indigo,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              child: Center(
                                                                  child: Text(
                                                                'Re-Assign This Service',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        19,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
