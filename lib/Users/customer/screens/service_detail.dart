import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'aboutprovider.dart';
import 'booksingleservice.dart';
import 'company_provider.dart';

class SingleServicedetail extends StatefulWidget {
  SingleServicedetail({
    super.key,
    required this.serviceid,
    required this.servicename,
    required this.serviceprice,
    required this.servicetype,
    required this.serviceimg,
    required this.serviceduration,
    required this.servicestatus,
    required this.servicediscount,
    required this.personcreatedservice,
    required this.servicecategory,
    required this.servicedescription,
    required this.serviceaddress,
    required this.serviceprovideremail,
  });

  final String serviceid;
  final String servicename;
  final String serviceprice;
  final String servicetype;
  final String serviceimg;
  final String serviceduration;
  final String servicestatus;
  final String servicediscount;
  final String personcreatedservice;
  final String servicecategory;
  final String servicedescription;
  final String serviceaddress;
  final String serviceprovideremail;

  @override
  State<SingleServicedetail> createState() => _SingleServicedetailState();
}

class _SingleServicedetailState extends State<SingleServicedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.indigo[300],
                        image: DecorationImage(
                            image: NetworkImage('${widget.serviceimg}'),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(color: Colors.grey[50]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.servicecategory}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFF5f60ba),
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.servicename}'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Price ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: Text(
                                    '\$${widget.serviceprice}',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.indigo,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: const Text(
                                    'Duration ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 8, 4, 4),
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  '${widget.serviceduration}',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.indigo,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: const Text(
                                    'Address',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 8, 4, 4),
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  '${widget.serviceaddress}',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.indigo,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '${widget.servicedescription}',
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                          height: 1.4),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'About Service Provider',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 24),
                  widget.personcreatedservice != 'deep@cleaning.com'
                      ? StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('employe')
                              .where('email',
                                  isEqualTo: '${widget.personcreatedservice}')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final result = snapshot.data!.docs[index];
                                      // print(result['profile_image'].toString());
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 20,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 90,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                        color: Colors.indigo,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                result[
                                                                    'profile_image']),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          result['fullname'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Aboutproviderdetail(
                                                                              provideremail: result['email'],
                                                                            )));
                                                          },
                                                          child: const Icon(
                                                            Icons.info_rounded,
                                                            color:
                                                                Colors.indigo,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      result['email'],
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }
                          },
                        )
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('company')
                              .where('email',
                                  isEqualTo: '${widget.personcreatedservice}')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final result = snapshot.data!.docs[index];
                                      // print(result['profile_image'].toString());
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 20,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 90,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                        color: Colors.indigo,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                result[
                                                                    'company_logo']),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          result[
                                                              'company_name'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Companydetail(
                                                                              provideremail: widget.personcreatedservice,
                                                                            )));
                                                          },
                                                          child: const Icon(
                                                            Icons.info_rounded,
                                                            color:
                                                                Colors.indigo,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      result['email'],
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Booksingleservice(
                            servicename: '${widget.servicename}',
                            serviceimg: '${widget.serviceimg}',
                            serviceprice: '${widget.serviceprice}',
                            servicediscount: '${widget.servicediscount}',
                            serviceprovideremail:
                                '${widget.personcreatedservice}',
                          )));
            },
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Book Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ));
  }
}
