import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/customer/screens/service_detail.dart';

import '../../freelancer/screens/chatscreen.dart';

class Aboutproviderdetail extends StatefulWidget {
  Aboutproviderdetail({super.key, this.provideremail});
  String? provideremail;
  @override
  State<Aboutproviderdetail> createState() => _AboutproviderdetailState();
}

class _AboutproviderdetailState extends State<Aboutproviderdetail> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About Provider'),
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
                    .collection('employe')
                    .where('email',
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
                                                  providerdetail[
                                                      'profile_image']),
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
                                        providerdetail['experience'],
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
                                                            customerid:
                                                                providerdetail[
                                                                    'id'],
                                                            customername:
                                                                providerdetail[
                                                                    'fullname'],
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 90,
                              height: 30,
                              decoration:
                                  BoxDecoration(color: Colors.blueGrey[50]),
                              child: Center(
                                child: Text(
                                  providerdetail['serivce_category'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
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
                              'Services',
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('service')
              .where('person_created_service',
                  isEqualTo: '${widget.provideremail}'.toString())
              .snapshots(),
          builder: (context, snapshot) {
            final servicesesprovider = snapshot.data?.docs.reversed.toList();
            final collectionid = snapshot.data?.docs[0].id;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data!.docs.length < 1) {
                return Center(
                  child: Text(
                    'Empty Services',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              } else {
                for (var servicesesprovider in servicesesprovider!) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () {
                            // print('clicked');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleServicedetail(
                                        serviceid: collectionid.toString(),
                                        servicename:
                                            servicesesprovider['Service_name'],
                                        serviceprice:
                                            servicesesprovider['Service_price'],
                                        servicetype:
                                            servicesesprovider['Service_type'],
                                        serviceimg:
                                            servicesesprovider['Service_image'],
                                        serviceduration: servicesesprovider[
                                            'Service_duration'],
                                        servicestatus: servicesesprovider[
                                            'Service_status'],
                                        servicediscount: servicesesprovider[
                                            'Servicec_discount'],
                                        personcreatedservice:
                                            servicesesprovider[
                                                'person_created_service'],
                                        servicecategory: servicesesprovider[
                                            'Service_category'],
                                        servicedescription: servicesesprovider[
                                            'Service_description'],
                                        serviceaddress: servicesesprovider[
                                            'Service_address'],
                                        serviceprovideremail:
                                            servicesesprovider[
                                                'person_created_service'])));
                          },
                          child: Column(
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
                                                  'Service_image']),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 80,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                servicesesprovider[
                                                    'Service_category'],
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
                                              servicesesprovider[
                                                      'Service_price']
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
                                        servicesesprovider['Service_name']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      subtitle: Text(
                                        // result['Service_description'],
                                        servicesesprovider[
                                                'Service_description']
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
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }
            }
            // return Container();
          },
        )
      ],
    );
  }
}
