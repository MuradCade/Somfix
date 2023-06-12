import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/customer/screens/service_detail.dart';

import 'chatscreen.dart';

class Aboutcutomer extends StatefulWidget {
  Aboutcutomer({super.key, this.provideremail});
  String? provideremail;
  @override
  State<Aboutcutomer> createState() => _AboutcutomerState();
}

class _AboutcutomerState extends State<Aboutcutomer> {
  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About Customer'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('customer')
                    .where('id',
                        isEqualTo: '${widget.provideremail}'.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  final providerdetail = snapshot.data?.docs.reversed.toList();
                  // Service provider collection id
                  final collectionid = snapshot.data?.docs[0].id;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    for (var providerdetail in providerdetail!) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 7,
                                    )
                                  ],
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo[100],
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  providerdetail['img']),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        providerdetail['fullname'],
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        providerdetail['email'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          //call button
                                          InkWell(
                                            onTap: () {
                                              print('call button clicked');
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              width: 80,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFF5f60ba),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.call,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      'Call',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          //message button
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Chatscreen(
                                                            customername:
                                                                providerdetail[
                                                                    'fullname'],
                                                            customerid:
                                                                providerdetail[
                                                                    'id'],
                                                          )));
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              width: 80,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    blurRadius: 7,
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.chat_outlined,
                                                      color: Colors.indigo[400],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Chat',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .indigo[400],
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Skills',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Personal Info',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail_outline_outlined,
                                        size: 25,
                                        color: Colors.indigo[300],
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        providerdetail['email'],
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        size: 25,
                                        color: Colors.indigo[300],
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        providerdetail['phone'],
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Services Booked ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          // serviceses
                          ProviderServices(
                            provideremail: '${widget.provideremail}',
                          ),
                        ],
                      );
                    }
                    return Container();
                  }
                  // return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// provider serviceses
class ProviderServices extends StatefulWidget {
  ProviderServices({super.key, this.provideremail});
  String? provideremail;

  @override
  State<ProviderServices> createState() => _ProviderServicesState();
}

class _ProviderServicesState extends State<ProviderServices> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('bookedservices')
              .where('client_id',
                  isEqualTo: '${widget.provideremail}'.toString())
              .snapshots(),
          builder: (context, snapshot) {
            final servicesesprovider = snapshot.data?.docs.reversed.toList();
            // final collectionid = snapshot.data?.docs[0].id;
            final currentuseremail = FirebaseAuth.instance.currentUser?.email;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              for (var servicesesprovider in servicesesprovider!) {
                // check every service customer booked and find
                // if the services is provider by current provider
                if (servicesesprovider['provideremail'].toString() ==
                    currentuseremail) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(children: [
                          Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              servicesesprovider[
                                                  'service_img']),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 110,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                servicesesprovider[
                                                    'servicestatus'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.indigo),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 7,
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 8, top: 10),
                                        width: 100,
                                        height: 34,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFF5f60ba),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                            child: Text(
                                          '\$' +
                                              servicesesprovider['price']
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 1.2,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                    ListTile(
                                      // mainAxisSize: MainAxisSize.min,
                                      title: Text(
                                        // result['Service_name'],
                                        servicesesprovider['service_name']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      subtitle: Text(
                                        // result['Service_description'],
                                        servicesesprovider['provideremail']
                                            .toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ],
                  );
                } else {
                  print('failed to found');
                }
              }
            }
            return Container();
          },
        )
      ],
    );
  }
}
