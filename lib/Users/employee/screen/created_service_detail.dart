import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../freelancer/screens/chatscreen.dart';
import '../data/update_service_status.dart';

class Createdservicedetailscreen extends StatefulWidget {
  final String assignedtoemail;
  Createdservicedetailscreen({required this.assignedtoemail});

  @override
  State<Createdservicedetailscreen> createState() =>
      _CreatedservicedetailscreenState();
}

class _CreatedservicedetailscreenState
    extends State<Createdservicedetailscreen> {
  Updateservicestatus updateservicestatus = Updateservicestatus();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Service Details'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bookedservices')
                    .where('assignedtoemail',
                        isEqualTo: widget.assignedtoemail.toString())
                    .snapshots(),
                // initialData: initialData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final result = snapshot.data!.docs.reversed.toList();
                    final collectionid = snapshot.data!.docs[0].id;

                    for (var result in result) {
                      return Column(
                        children: [
                          //  Padding(
                          Container(
                            width: double.infinity,
                            height: 200,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.indigo[200],
                                image: DecorationImage(
                                    image: NetworkImage(result['service_img']),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: result['servicestatus'] == "Pending"
                                        ? Colors.red[100]
                                        : result['servicestatus'] == "Accepted"
                                            ? Colors.green[100]
                                            : result['servicestatus'] ==
                                                    "Assigned"
                                                ? Colors.green[100]
                                                : result['servicestatus'] ==
                                                        'Completed'
                                                    ? Colors.green[100]
                                                    : result['servicestatus'] ==
                                                            "Cancelled"
                                                        ? Colors.red[100]
                                                        : result['servicestatus'] ==
                                                                "Verified"
                                                            ? Colors.green[100]
                                                            : result['servicestatus'] ==
                                                                    "Started"
                                                                ? Colors
                                                                    .red[100]
                                                                : result['servicestatus'] ==
                                                                        'Re-Assigned'
                                                                    ? Colors.green[
                                                                        100]
                                                                    : Colors
                                                                        .transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  result['servicestatus'] == "Pending"
                                      ? "Pending"
                                      : result['servicestatus'].toString() ==
                                              'Accepted'
                                          ? 'Accepted'
                                          : result['servicestatus']
                                                      .toString() ==
                                                  'Assigned'
                                              ? 'Assigned'
                                              : result['servicestatus']
                                                          .toString() ==
                                                      'Re-Assigned'
                                                  ? 'Re-Assigned'
                                                  : result['servicestatus']
                                                              .toString() ==
                                                          'Completed'
                                                      ? 'Completed'
                                                      : result['servicestatus']
                                                                  .toString() ==
                                                              'Cancelled'
                                                          ? 'Cancelled'
                                                          : result['servicestatus']
                                                                      .toString() ==
                                                                  'Verified'
                                                              ? 'Verified'
                                                              : result['servicestatus']
                                                                          .toString() ==
                                                                      'Started'
                                                                  ? 'Started'
                                                                  : '',
                                  style: TextStyle(
                                      color: result['servicestatus'] ==
                                              "Pending"
                                          ? Colors.red[600]
                                          : result['servicestatus'] ==
                                                  "Accepted"
                                              ? Colors.green[600]
                                              : result['servicestatus'] ==
                                                      "Assigned"
                                                  ? Colors.green[600]
                                                  : result['servicestatus'] ==
                                                          'Completed'
                                                      ? Colors.green[600]
                                                      : result['servicestatus'] ==
                                                              "Cancelled"
                                                          ? Colors.red[600]
                                                          : result['servicestatus'] ==
                                                                  "Verified"
                                                              ? Colors
                                                                  .green[600]
                                                              : result['servicestatus'] ==
                                                                      "Started"
                                                                  ? Colors
                                                                      .red[600]
                                                                  : result['servicestatus'] ==
                                                                          'Re-Assigned'
                                                                      ? Colors.green[
                                                                          600]
                                                                      : Colors
                                                                          .transparent,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                            // width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Booking ID',
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '#' + result['service_id'].toString(),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result['service_name'].toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Date:',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      result['date'].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Time:',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      result['time'].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    result['description'].toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'About Provider',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // company detail
                                Compnyinfo(
                                  companyemail:
                                      result['provideremail'].toString(),
                                ),
                                // const SizedBox(height: 12,),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'About Customer',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Customerinfo(
                                  cutomerid: result['client_id'].toString(),
                                )
                              ],
                            ),
                          ),
                          // Accept or decline btn

                          result['servicestatus'] == 'Started'
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      final output = await updateservicestatus
                                          .updateservicestatus(
                                              collectionid: collectionid,
                                              status: "Completed");
                                      if (output == 'success') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Service Completed Successfully',
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
                                            output.toString(),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          duration: const Duration(seconds: 1),
                                        ));
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          'Complete Services',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : result['servicestatus'] == 'Completed'
                                  ? Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          color: Colors.green[100]),
                                      child: Center(
                                          child: Text(
                                        'Service Completed, Waiting For Customer Verification',
                                        style: TextStyle(
                                            color: Colors.green[600],
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )
                                  : result['servicestatus'] == 'Accepted'
                                      ? Container(
                                          margin: const EdgeInsets.only(
                                              left: 34.0, top: 12),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final output =
                                                      await updateservicestatus
                                                          .updateassignerresponse(
                                                              servicestatus:
                                                                  'Assigned',
                                                              collectionid:
                                                                  collectionid,
                                                              status: "true");
                                                  if (output == 'success') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        'Service Accepted Successfully',
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 1),
                                                    ));
                                                    Navigator.pop(context);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        output.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 1),
                                                    ));
                                                  }
                                                },
                                                child: Container(
                                                  width: 140,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                      color: Colors.indigo,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Center(
                                                    child: Text(
                                                      'Accept',
                                                      style: TextStyle(
                                                          fontSize: 19,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final output =
                                                      await updateservicestatus
                                                          .updateassignerresponse(
                                                              servicestatus:
                                                                  'Cancelled',
                                                              collectionid:
                                                                  collectionid,
                                                              status: "false");
                                                  if (output == 'success') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        'Service Cancelled Successfully',
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 1),
                                                    ));
                                                    Navigator.pop(context);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        output.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 1),
                                                    ));
                                                  }
                                                },
                                                child: Container(
                                                  width: 140,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red[100],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          fontSize: 19,
                                                          color:
                                                              Colors.red[800],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : result['servicestatus'] == 'Cancelled'
                                          ? Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.all(14),
                                              decoration: BoxDecoration(
                                                  color: Colors.red[100]),
                                              child: Center(
                                                  child: Text(
                                                'Sorry Service Is Cancelled',
                                                style: TextStyle(
                                                    color: Colors.red[600],
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            )
                                          : result['servicestatus'] ==
                                                  'Assigned'
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final output =
                                                          await updateservicestatus
                                                              .updateservicestatus(
                                                                  collectionid:
                                                                      collectionid,
                                                                  status:
                                                                      "Started");
                                                      if (output == 'success') {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                            'Service Started Successfully',
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                        ));
                                                        Navigator.pop(context);
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                            output.toString(),
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                        ));
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 65,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.red[500],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Center(
                                                        child: Text(
                                                          'Start Service',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 19),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(),

                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      );
                    }
                    return const Text('');
                    // }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Compnyinfo extends StatefulWidget {
  const Compnyinfo({super.key, required this.companyemail});
  final String companyemail;

  @override
  State<Compnyinfo> createState() => _CompnyinfoState();
}

class _CompnyinfoState extends State<Compnyinfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('company')
              .where('email', isEqualTo: widget.companyemail.toString())
              .snapshots(),
          // initialData: initialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final result = snapshot.data!.docs.reversed.toList();
              for (var result in result) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.indigo[50],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.indigo[100],
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(result['company_logo']),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result['company_name'],
                                style: const TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                result['email'],
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Chatscreen(
                                            customerid: result['id'],
                                            customername:
                                                result['company_name'],
                                          )));
                            },
                            child: Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Chat',
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Call',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
              return Container();
            }
          },
        ),
      ],
    );
  }
}

class Customerinfo extends StatefulWidget {
  Customerinfo({
    super.key,
    required this.cutomerid,
  });
  final String cutomerid;
  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('customer')
              .where('id', isEqualTo: widget.cutomerid.toString())
              .snapshots(),
          // initialData: initialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final result = snapshot.data!.docs.reversed.toList();
              for (var result in result) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.indigo[50],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.indigo[100],
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(result['img']),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result['fullname'],
                                style: const TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                result['email'],
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Chatscreen(
                                            customerid: result['id'],
                                            customername: result['fullname'],
                                          )));
                            },
                            child: Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Chat',
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Call',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
              return Container();
            }
          },
        ),
      ],
    );
  }
}
