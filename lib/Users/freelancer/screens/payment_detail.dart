import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Paymentdetail extends StatefulWidget {
  final String id;
  final String servicename;
  final String date;
  final String time;
  final String description;
  final String payment_status;
  final String payment_method;
  final String totalamount;
  final String service_img;
  final String customer_id;
  const Paymentdetail(
      {super.key,
      required this.id,
      required this.servicename,
      required this.date,
      required this.time,
      required this.description,
      required this.payment_status,
      required this.payment_method,
      required this.totalamount,
      required this.service_img,
      required this.customer_id});

  @override
  State<Paymentdetail> createState() => _PaymentdetailState();
}

class _PaymentdetailState extends State<Paymentdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments Details'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking ID',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text(
                      '#' + widget.id.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service name',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Date: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              widget.date.toString(),
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Time: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              widget.time.toString(),
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          image: DecorationImage(
                              image: NetworkImage(widget.service_img),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description.toString(),
                  maxLines: 5,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400, height: 1.4),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Payment Detail',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 14,
                ),
                // payment details
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.indigo[50]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Payment Status',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.payment_status.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 240, 240)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Payment Method',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.payment_method.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 240, 240)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$' + widget.totalamount,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // about customer
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'About Customer',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),

                const SizedBox(
                  height: 12,
                ),
                Customerdetail(
                  customerid: widget.customer_id.toString(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Customerdetail extends StatefulWidget {
  final String customerid;
  const Customerdetail({super.key, required this.customerid});

  @override
  State<Customerdetail> createState() => _CustomerdetailState();
}

class _CustomerdetailState extends State<Customerdetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('customer')
              .where('id', isEqualTo: widget.customerid.toString())
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final result = snapshot.data!.docs.reversed.toList();

              for (var result in result) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.indigo[50]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.indigo[100],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(result['img']),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              result['fullname'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.indigo[500],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  result['email'].toString(),
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            }
          },
        )
      ],
    );
  }
}
