import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'aboutcustomer.dart';

// import '';

class Bookedservices extends StatefulWidget {
  Bookedservices({super.key, required this.serviceid});
  final String serviceid;

  @override
  State<Bookedservices> createState() => _BookedservicesState();
}

class _BookedservicesState extends State<Bookedservices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      isEqualTo: int.parse('${widget.serviceid}'))
                  .snapshots(),
              builder: (context, snapshot) {
                final bookedservicebycustomer =
                    snapshot.data?.docs.reversed.toList();
                final collectionid = snapshot.data?.docs[0].id;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  for (var bookedservicebycustomer
                      in bookedservicebycustomer!) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: bookedservicebycustomer['servicestatus'] ==
                                      'Pending'
                                  ? Colors.red[50]
                                  : bookedservicebycustomer['servicestatus'] ==
                                          'Accepted'
                                      ? Colors.green[50]
                                      : bookedservicebycustomer[
                                                  'servicestatus'] ==
                                              'Cancelled'
                                          ? Colors.red[50]
                                          : bookedservicebycustomer[
                                                      'servicestatus'] ==
                                                  'Completed'
                                              ? Colors.green[50]
                                              : bookedservicebycustomer[
                                                          'servicestatus'] ==
                                                      'Verified'
                                                  ? Colors.green[50]
                                                  : Colors.transparent),
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, left: 12),
                            child: Text(
                              bookedservicebycustomer['servicestatus'] ==
                                      'Pending'
                                  ? 'Waiting for your approval'
                                  : bookedservicebycustomer['servicestatus'] ==
                                          'Accepted'
                                      ? 'Booked Service Accepted'
                                      : bookedservicebycustomer[
                                                  'servicestatus'] ==
                                              'Cancelled'
                                          ? 'Booked Service Cancelled'
                                          : bookedservicebycustomer[
                                                      'servicestatus'] ==
                                                  'Completed'
                                              ? 'Waiting for Customer Payment Verification'
                                              : bookedservicebycustomer[
                                                          'servicestatus'] ==
                                                      'Verified'
                                                  ? 'Service is completed and payment is verified'
                                                  : '',
                              style: TextStyle(
                                  color: bookedservicebycustomer[
                                              'servicestatus'] ==
                                          'Pending'
                                      ? Colors.red[600]
                                      : bookedservicebycustomer[
                                                  'servicestatus'] ==
                                              'Accepted'
                                          ? Colors.green[600]
                                          : bookedservicebycustomer[
                                                      'servicestatus'] ==
                                                  'Cancelled'
                                              ? Colors.red[600]
                                              : bookedservicebycustomer[
                                                          'servicestatus'] ==
                                                      'Completed'
                                                  ? Colors.green[600]
                                                  : bookedservicebycustomer[
                                                              'servicestatus'] ==
                                                          'Verified'
                                                      ? Colors.green[600]
                                                      : Colors.transparent,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Booking ID',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '#' +
                                    bookedservicebycustomer['service_id']
                                        .toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    bookedservicebycustomer['service_name'],
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Time: ',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        bookedservicebycustomer['time']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Date:',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        bookedservicebycustomer['date']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            bookedservicebycustomer[
                                                'service_img']),
                                        fit: BoxFit.cover)),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'About Customer',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Customerinfo(
                          customerid:
                              bookedservicebycustomer['client_id'].toString(),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Price Details',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(color: Colors.indigo[50]),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'price:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '\$' +
                                        bookedservicebycustomer['price']
                                            .toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Payment Method:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    bookedservicebycustomer['payment_method']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Payment Status:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    bookedservicebycustomer['payment_status']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        // button of start serviceses
                        // then service compeleted button
                        // get random generated from the customer then the payment occur
                        const SizedBox(
                          height: 14,
                        ),
                        bookedservicebycustomer['servicestatus'] == 'Accepted'
                            ? Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Complete Service',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : bookedservicebycustomer['servicestatus'] ==
                                    'Accepted'
                                ? Container()
                                : Container(),
                      ],
                    );
                  }
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class Customerinfo extends StatefulWidget {
  Customerinfo({super.key, required this.customerid});
  String? customerid;
  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      // child: Text(widget.customerid.toString()),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('customer')
            .where('id', isEqualTo: '${widget.customerid}'.toString())
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final customerdata = snapshot.data?.docs.reversed.toList();
          final collectionid = snapshot.data?.docs[0].id;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            for (var customerdata in customerdata!) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 155,
                      decoration: BoxDecoration(color: Colors.indigo[50]),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12, left: 12),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Name: ',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      customerdata['fullname'].toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Aboutcutomer(
                                                      provideremail:
                                                          '${widget.customerid}',
                                                    )));
                                      },
                                      child: const Text(
                                        ' | More',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12, left: 12),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Email: ',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      customerdata['email'].toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8, left: 12),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Phone: ',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      customerdata['phone'].toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8, left: 12),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Address: ',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      customerdata['address'].toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          }
        },
      ),
    );
  }
}
