import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../customer/data/bookservice_class.dart';
import '../data/bookedservice_logic.dart';
import '../messages.dart';
import 'bookedservices.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen> {
  List datetimepicker = [];
  DateTime datetime = DateTime(2022, 02, 25, 12, 30);
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  Bookedservice updatestatuinclickbtn = Bookedservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFffffff),
      appBar: AppBar(
        title: const Text('Bookings'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
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
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('bookedservices')
                      .where('provideremail',
                          isEqualTo: FirebaseAuth.instance.currentUser?.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                        height: 420,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final result = snapshot.data!.docs[index];
                            final collectionid = snapshot.data!.docs[index].id;
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Bookedservices(
                                                      serviceid:
                                                          result['service_id']
                                                              .toString())));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 500,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            blurRadius: 18,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.indigo[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              result[
                                                                  'service_img']),
                                                          fit: BoxFit.cover)),
                                                ),
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
                                                        width: 100,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: result[
                                                                      'servicestatus'] ==
                                                                  'Pending'
                                                              ? Colors.red[50]
                                                              : result['servicestatus'] ==
                                                                      'Accepted'
                                                                  ? Colors
                                                                      .green[50]
                                                                  : result['servicestatus'] ==
                                                                          'Cancelled'
                                                                      ? Colors.red[
                                                                          50]
                                                                      : result['servicestatus'] ==
                                                                              'Completed'
                                                                          ? Colors
                                                                              .green[50]
                                                                          : result['servicestatus'] == 'Verified'
                                                                              ? Colors.green[50]
                                                                              : Colors.transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Center(
                                                            child: Text(
                                                              result[
                                                                  'servicestatus'],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: result[
                                                                              'servicestatus'] ==
                                                                          'Pending'
                                                                      ? Colors.red[
                                                                          600]
                                                                      : result['servicestatus'] ==
                                                                              'Accepted'
                                                                          ? Colors
                                                                              .green[600]
                                                                          : result['servicestatus'] == 'Cancelled'
                                                                              ? Colors.red[600]
                                                                              : result['servicestatus'] == 'Completed'
                                                                                  ? Colors.green[600]
                                                                                  : result['servicestatus'] == 'Verified'
                                                                                      ? Colors.green[600]
                                                                                      : Colors.transparent,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 100),
                                                        child: Text(
                                                          '#' +
                                                              result['service_id']
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .indigo),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    result['service_name'],
                                                    style: TextStyle(
                                                        fontSize: 20,
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
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.indigo,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo[50]),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Date & Time',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          result['date']
                                                                  .toString() +
                                                              ' At ' +
                                                              result['time']
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Address',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          result['address']
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Payment Method',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          result['payment_method']
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Payment Status',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          result['payment_status']
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          result['servicestatus'] == 'Pending'
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          // accept booked service by customer
                                                          final output = updatestatuinclickbtn
                                                              .changestatustoaccepted(
                                                                  collectionid:
                                                                      collectionid
                                                                          .toString(),
                                                                  datapassed:
                                                                      'Accepted');
                                                          if (output ==
                                                              'success') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                'Service Is Accepted'
                                                                    .toString(),
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
                                                                    const SnackBar(
                                                              content: Text(
                                                                'Booking Accepted Successfully',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 110,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.indigo,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                              'Accepted',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          //decline service booked by customer
                                                          final output = updatestatuinclickbtn
                                                              .changestatustocancel(
                                                                  collectionid:
                                                                      collectionid
                                                                          .toString(),
                                                                  datapassed:
                                                                      'Cancelled');
                                                          if (output ==
                                                              'success') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                              content: Text(
                                                                'Booking Cancelled Successfully',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                output
                                                                    .toString(),
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
                                                          width: 110,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .red[50],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                              'Decline',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red[600],
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : result['servicestatus'] ==
                                                      'Accepted'
                                                  ? Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            //decline service booked by customer
                                                            final output = updatestatuinclickbtn
                                                                .changestatustocompleted(
                                                                    collectionid:
                                                                        collectionid
                                                                            .toString(),
                                                                    datapassed:
                                                                        'Completed');
                                                            if (output ==
                                                                'success') {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                content: Text(
                                                                  'Booking Completed Successfully',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            1),
                                                              ));
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: Text(
                                                                  output
                                                                      .toString(),
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
                                                            width: 240,
                                                            height: 80,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .indigo,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Center(
                                                              child: Text(
                                                                'Confirm Service Completions',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : result['servicestatus'] ==
                                                          'Cancelled'
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 80,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                            .red[
                                                                        50]),
                                                            child: Center(
                                                              child: Text(
                                                                'Sorry Booked Service Is Cancelled',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                            .red[
                                                                        600]),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : result['servicestatus'] ==
                                                              'Completed'
                                                          ? Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color:
                                                                              Colors.green[50]),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Service Completed , Waiting For  Payment Verification ',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.green[600]),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : result['servicestatus'] ==
                                                                  'Verified'
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(4),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 80,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Colors.green[50]),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Service Completed And Payment Verified Successfully ',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.green[600]),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]);
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
