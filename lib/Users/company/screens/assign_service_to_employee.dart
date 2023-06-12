import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/assign_service.dart';

class AssignBookedservice extends StatefulWidget {
  final String collection_id;
  const AssignBookedservice({super.key, required this.collection_id});

  @override
  State<AssignBookedservice> createState() => _AssignBookedserviceState();
}

class _AssignBookedserviceState extends State<AssignBookedservice> {
  bool showvalue = false;
  AssignService assignservice = AssignService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Service To Employee'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('employe')
                  .where('company_associated',
                      isEqualTo: FirebaseAuth.instance.currentUser!.email)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final result = snapshot.data!.docs[index];
                        final collectionid = snapshot.data!.docs[index].id;
                        return Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: InkWell(
                                    onTap: () async {
                                      final output = await assignservice
                                          .assignsingleservice(
                                              collectionid: widget.collection_id
                                                  .toString(),
                                              assignsertvicetoemail:
                                                  result['email']);
                                      if (output == 'success') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Service Assigned Successfully',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          duration: const Duration(seconds: 1),
                                        ));
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
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFfcfcfc),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 7,
                                            )
                                          ]),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 76,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.indigo[200],
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          result[
                                                              'profile_image']),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                result['fullname'],
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                result['email'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
      )),
    );
  }
}
