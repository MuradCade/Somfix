import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('bookedservices')
                      .where('provideremail',
                          isEqualTo: FirebaseAuth.instance.currentUser!.email)
                      .snapshots(),
                  // initialData: initialData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 800,
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final result = snapshot.data!.docs[index];
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.indigo[50],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.indigo[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            result[
                                                                'service_img']),
                                                        fit: BoxFit.cover)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    result['service_name'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    '\$' +
                                                        result['price']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.indigo,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    'Assigned To: ' +
                                                        result['assignedtoemail']
                                                            .toString(),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                        fontSize: 14.20,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Assigned Status: ',
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                          fontSize: 15.20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        result['assignstatus']
                                                                    .toString() ==
                                                                'true'
                                                            ? 'Accepted'
                                                            : result['assignstatus']
                                                                        .toString() ==
                                                                    'false'
                                                                ? 'Cancelled'
                                                                : '',
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                            fontSize: 15.20,
                                                            color: result[
                                                                        'assignstatus'] ==
                                                                    'true'
                                                                ? Colors
                                                                    .green[600]
                                                                : result['assignstatus'] ==
                                                                        'false'
                                                                    ? Colors.red[
                                                                        600]
                                                                    : Colors
                                                                        .transparent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }),
      )),
    );
  }
}
