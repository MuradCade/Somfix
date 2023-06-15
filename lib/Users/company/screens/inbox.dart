import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../freelancer/screens/chatscreen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final currenuserid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    print(currenuserid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
        actions: const [],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('massages')
                  .doc(currenuserid)
                  .collection('usermessages')
                  .snapshots(),
              builder: (context, snapshot) {
                // Service provider collection id
                // final collectionid = snapshot.data?.docs.id;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final collectionsid = snapshot.data!.docs[index].id;
                        final result = snapshot.data!.docs[index];
                        print('collection id' + collectionsid.toString());
                        return Column(
                          children: [
                            Customerinfo(
                              collectionid: collectionsid.toString(),
                              sendtime: result['sendtime'].toString(),
                              last_msg: result['last_msg'].toString(),
                            ),
                            Empinfo(
                              collectionid: collectionsid.toString(),
                              sendtime: result['sendtime'].toString(),
                              last_msg: result['last_msg'].toString(),
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

class Empinfo extends StatefulWidget {
  Empinfo({
    super.key,
    required this.collectionid,
    required this.last_msg,
    required this.sendtime,
  });
  final String collectionid;
  final String last_msg;
  final String sendtime;
  @override
  State<Empinfo> createState() => _EmpinfoState();
}

class _EmpinfoState extends State<Empinfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('employe')
          .where('id', isEqualTo: widget.collectionid.toString())
          .snapshots(),
      builder: (context, snapshot) {
        // Service provider collection id
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final result = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.indigo[100],
                            borderRadius: BorderRadius.circular(52),
                            image: DecorationImage(
                                image: NetworkImage(result['profile_image']),
                                fit: BoxFit.cover)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chatscreen(
                                        customername: result['fullname'],
                                        customerid: result['id'],
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    result['fullname'],
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    widget.sendtime.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.last_msg.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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

class Customerinfo extends StatefulWidget {
  Customerinfo({
    super.key,
    required this.collectionid,
    required this.last_msg,
    required this.sendtime,
  });
  final String collectionid;
  final String last_msg;
  final String sendtime;
  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('customer')
          .where('id', isEqualTo: widget.collectionid.toString())
          .snapshots(),
      builder: (context, snapshot) {
        // Service provider collection id
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final result = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.indigo[100],
                            borderRadius: BorderRadius.circular(52),
                            image: DecorationImage(
                                image: NetworkImage(result['img']),
                                fit: BoxFit.cover)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chatscreen(
                                        customername: result['fullname'],
                                        customerid: result['id'],
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    result['fullname'],
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    widget.sendtime.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.last_msg.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
