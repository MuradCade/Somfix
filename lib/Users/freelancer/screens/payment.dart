import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../messages.dart';
import 'payment_detail.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFffffff),
      appBar: AppBar(
        title: const Text('Payments'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Messageinbox()));
              },
              icon: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6)),
                child: const Icon(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('bookedservices')
                        .where('provideremail',
                            isEqualTo: FirebaseAuth.instance.currentUser?.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      // print(FirebaseAuth.instance.currentUser?.email);
                      if (snapshot.data!.docs.length < 1) {
                        return Center(
                          child: Text(
                            'No Data Found',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      } else {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final result = snapshot.data!.docs.reversed.toList();
                          for (var result in result) {
                            if (result['payment_status'].toString() ==
                                'Verified') {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Paymentdetail(
                                                    id: result['service_id']
                                                        .toString(),
                                                    servicename:
                                                        result['service_name']
                                                            .toString(),
                                                    date: result['date']
                                                        .toString(),
                                                    time: result['time']
                                                        .toString(),
                                                    description:
                                                        result['description']
                                                            .toString(),
                                                    payment_status:
                                                        result['payment_status']
                                                            .toString(),
                                                    payment_method:
                                                        result['payment_method']
                                                            .toString(),
                                                    service_img:
                                                        result['service_img']
                                                            .toString(),
                                                    totalamount:
                                                        result['totalamount']
                                                            .toString(),
                                                    customer_id:
                                                        result['client_id']
                                                            .toString(),
                                                  )));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.indigo[50]),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    const Text(
                                                      'Service Id',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '#' +
                                                          result['service_id']
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
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 243, 240, 240)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Payment Status',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      result['payment_status']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 243, 240, 240)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Payment Method',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      result['payment_method']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 243, 240, 240)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Amount',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '\$' +
                                                          result['totalamount']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 243, 240, 240)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    Text(
                                                      'Date',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '2-02-2023',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Center(child: Text('Nothing to display'));
                            }
                          }
                          return Container();
                        }
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
