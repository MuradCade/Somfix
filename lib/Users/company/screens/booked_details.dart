// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bookeddetails extends StatefulWidget {
  const Bookeddetails({super.key, required this.provideremail});
  final provideremail;

  @override
  State<Bookeddetails> createState() => _BookeddetailsState();
}

class _BookeddetailsState extends State<Bookeddetails> {
  @override
  void initState() {
    super.initState();
    print(widget.provideremail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bookedservices')
                    .where('provideremail',
                        isEqualTo: widget.provideremail.toString())
                    .snapshots(),
                // initialData: initialData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final result = snapshot.data!.docs.reversed.toList();
                    for (var result in result) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Booking ID',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '#' + result['service_id'].toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 20,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result['service_name'],
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade900),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Date:',
                                        style: TextStyle(
                                            fontSize: 17,
                                            // color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        result['date'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Time:',
                                        style: TextStyle(
                                            fontSize: 17,
                                            // color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(result['time'],
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.indigo,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.indigo[300],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(result['service_img']),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 30,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            result['description'],
                            style: TextStyle(fontSize: 17, height: 1.5),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'About Customer',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Providerdetail(customerid: result['client_id']),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text(
                            'Price Details',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(color: Colors.indigo[50]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '\$' + result['price'].toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
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
                                      Text(
                                        'Discount:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '\$' + result['discount'].toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
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
                                      Text(
                                        'Payment Method:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        result['payment_method'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.indigo),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Providerdetail extends StatefulWidget {
  const Providerdetail({super.key, required this.customerid});
  final String customerid;

  @override
  State<Providerdetail> createState() => _ProviderdetailState();
}

class _ProviderdetailState extends State<Providerdetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('customer')
              .where('id', isEqualTo: widget.customerid.toString())
              .snapshots(),
          // initialData: initialData,
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
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.indigo[50],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(result['img']),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                result['fullname'],
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: Colors.indigo,
                                size: 26,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            result['email'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
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
