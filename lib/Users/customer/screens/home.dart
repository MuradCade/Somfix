import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:somfixapp/Users/customer/screens/service_detail.dart';

// import 'package:somfixapp/mainscreens/login.dart';
// import '../data/displaysinglecompanydetail.dart';
import 'notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard'),
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          const MyNotification(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 14,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service Category',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('servicecategory')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 120.0,
                      child: ListView.builder(
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data!.docs[index];
                          return Card(
                            child: Container(
                              width: 110,
                              height: 84,
                              padding: const EdgeInsets.all(2),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          NetworkImage(data['service_image']),
                                      height: 45,
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      data['servicename'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 17),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(right: 18),
                      child: const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFF127EC3),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Fetchcompanydata(),
              // ? recomended card service provider (employees)
            ]),
          ),
        ),
      ),
    );
  }
}

class Fetchcompanydata extends StatefulWidget {
  Fetchcompanydata({super.key});

  @override
  State<Fetchcompanydata> createState() => _FetchcompanydataState();
}

class _FetchcompanydataState extends State<Fetchcompanydata> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('service').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final result = snapshot.data!.docs[index];
                final serviceid = snapshot.data!.docs[index].id;
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleServicedetail(
                                    serviceid: serviceid.toString(),
                                    servicename: result['Service_name'],
                                    serviceprice: result['Service_price'],
                                    servicetype: result['Service_type'],
                                    serviceimg: result['Service_image'],
                                    serviceduration: result['Service_duration'],
                                    servicestatus: result['Service_status'],
                                    servicediscount:
                                        result['Servicec_discount'],
                                    personcreatedservice:
                                        result['person_created_service'],
                                    servicecategory: result['Service_category'],
                                    servicedescription:
                                        result['Service_description'],
                                    serviceaddress: result['Service_address'],
                                  )));
                    },
                    child: Container(
                      width: 240,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 7,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 185,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 7,
                                    )
                                  ],
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(result['Service_image']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          height: 34,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Text(
                                            result['Service_category'],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 1.2,
                                                color: Color(0xFFF5f60ba),
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
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
                                                result['Service_price'] +
                                                '.00',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 1.2,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      )),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            // mainAxisSize: MainAxisSize.min,
                            title: Text(
                              // result['Service_name'],
                              result['Service_name'],
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),

                            subtitle: Text(
                              // result['Service_description'],
                              result['Service_description'],
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
