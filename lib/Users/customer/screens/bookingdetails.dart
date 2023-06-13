import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/bookservice_class.dart';
import 'aboutprovider.dart';
import 'company_provider.dart';

class Bookingdetailpage extends StatefulWidget {
  Bookingdetailpage({super.key, required this.service_id});
  final String service_id;
  @override
  State<Bookingdetailpage> createState() => _BookingdetailpageState();
}

class _BookingdetailpageState extends State<Bookingdetailpage> {
  Bookservice deleteservice = Bookservice();
  List collectionidlist = [];
  String servicestatuscheck = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Booking Detail'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bookedservices')
                    .where('service_id',
                        isEqualTo: int.parse('${widget.service_id}'))
                    .snapshots(),
                builder: (context, snapshot) {
                  final bookedservice = snapshot.data?.docs.reversed.toList();
                  final collectionid = snapshot.data?.docs[0].id;
                  collectionidlist.add(collectionid);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // final result = snapshot.data!.docs[index];
                    for (var bookedservice in bookedservice!) {
                      // final servicestatus = bookedservice['servicestatus'];
                      // collectionidlist.add(servicestatus);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: bookedservice['servicestatus'] ==
                                        'Cancelled'.toString()
                                    ? Colors.red[50]
                                    : bookedservice['servicestatus']
                                                .toString() ==
                                            'Accepted'.toString()
                                        ? Colors.green[50]
                                        : bookedservice['servicestatus'] ==
                                                'Pending'.toString()
                                            ? Colors.red[50]
                                            : bookedservice['servicestatus'] ==
                                                    'Completed'.toString()
                                                ? Colors.green[50]
                                                : bookedservice[
                                                            'servicestatus'] ==
                                                        'Verified'.toString()
                                                    ? Colors.green[50]
                                                    : bookedservice[
                                                                'servicestatus'] ==
                                                            'Started'.toString()
                                                        ? Colors.red[50]
                                                        : bookedservice[
                                                                    'servicestatus'] ==
                                                                'Started'
                                                                    .toString()
                                                            ? Colors.green[50]
                                                            : bookedservice[
                                                                        'servicestatus'] ==
                                                                    'Assigned'
                                                                        .toString()
                                                                ? Colors
                                                                    .green[50]
                                                                : bookedservice[
                                                                            'servicestatus'] ==
                                                                        'Re-Assigned'
                                                                            .toString()
                                                                    ? Colors.green[
                                                                        50]
                                                                    : Colors
                                                                        .transparent),
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, top: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  bookedservice['servicestatus'] == 'Verified'
                                      ? Text(
                                          'Service is Completed And Payment is Verified',
                                          style: TextStyle(
                                              color: Colors.green[600],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : bookedservice['servicestatus'] ==
                                              'Cancelled'.toString()
                                          ? Text(
                                              'Sorry Service Is Cancelled By The Provider',
                                              style: TextStyle(
                                                  color: Colors.red[600],
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          : bookedservice['servicestatus'] ==
                                                  'Pending'.toString()
                                              ? Text(
                                                  'Waiting For Provider Approval',
                                                  style: TextStyle(
                                                      color: Colors.red[600],
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              : bookedservice['servicestatus']
                                                          .toString() ==
                                                      'Accepted'
                                                  ? Text(
                                                      'Booking Accepted By Provider',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.green[500],
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  : bookedservice[
                                                              'servicestatus'] ==
                                                          'Assigned'
                                                      ? Text(
                                                          'Service Is Assigned',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .green[500],
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      : bookedservice[
                                                                  'servicestatus'] ==
                                                              'Re-Assigned'
                                                          ? Text(
                                                              'Service Is Re-Assigned',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .green[
                                                                      500],
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          : bookedservice[
                                                                      'servicestatus'] ==
                                                                  'Started'
                                                              ? Text(
                                                                  'Service Is Started',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .red[
                                                                          500],
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              : bookedservice[
                                                                          'servicestatus'] ==
                                                                      'Completed'
                                                                  ? Text(
                                                                      'Service Is Completed',
                                                                      style: TextStyle(
                                                                          color: Colors.red[
                                                                              500],
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    )
                                                                  : Text(''),
                                  bookedservice['servicestatus'].toString() ==
                                          'Completed'
                                      ? Container()
                                      : InkWell(
                                          onTap: () async {
                                            final output = await deleteservice
                                                .deletesignleservice(
                                                    id: collectionid
                                                        .toString());
                                            if (output == 'success') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  'Booked Service Deleted Successfully',
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                duration:
                                                    const Duration(seconds: 1),
                                              ));
                                              Navigator.pop(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  output,
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                duration:
                                                    const Duration(seconds: 1),
                                              ));
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red[600],
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Booking ID',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  '#' + bookedservice['service_id'].toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(
                              color: Colors.black54,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      bookedservice['service_name'].toString(),
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Date: ',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          bookedservice['date'].toString(),
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Time: ',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          bookedservice['time'].toString(),
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[50],
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              bookedservice['service_img']
                                                  .toString()),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              bookedservice['description'],
                              maxLines: 5,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'About Provider',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 4,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bookedservice['provideremail'] ==
                                          'deep@cleaning.com'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                bookedservice['provideremail'],
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
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
                                                              Companydetail(
                                                                provideremail:
                                                                    bookedservice[
                                                                        'provideremail'],
                                                              )));
                                                },
                                                child: const Text(
                                                  '| More',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.indigo,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                bookedservice['provideremail'],
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
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
                                                              Aboutproviderdetail(
                                                                provideremail:
                                                                    bookedservice[
                                                                        'provideremail'],
                                                              )));
                                                },
                                                child: const Text(
                                                  '| More',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.indigo,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Price Detail',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 75,
                              decoration: BoxDecoration(
                                  color: Colors.indigo[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 18.0, left: 1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Price',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '\$' +
                                                bookedservice['price']
                                                    .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // cancel service btn
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                // change the status of service when its cancelled
                                String output =
                                    await deleteservice.changestatustocancel(
                                        collectionid: collectionid.toString(),
                                        datapassed: 'Completed');
                                if (output == 'success') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Booked service is Completed',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      output,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                }
                              },
                              child: bookedservice['servicestatus'] ==
                                      'Pending'.toString()
                                  ? Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red[50],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'Confirm Booking',
                                        style: TextStyle(
                                            color: Colors.red[600],
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )
                                  : bookedservice['servicestatus'] ==
                                          'Canceled'.toString()
                                      ? Container()
                                      : bookedservice['servicestatus'] ==
                                              'Accepted'.toString()
                                          ? Container()
                                          : bookedservice['servicestatus'] ==
                                                  'Completed'.toString()
                                              ? Container()
                                              : Container(),
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  }

                  // return
                }),
          ],
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
