import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../freelancer/screens/chatscreen.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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
        title: const Text('Inbox'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
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
                final massages = snapshot.data!.docs.reversed.toList();
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
                    height: 900,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final collectionsid = snapshot.data!.docs[index].id;
                        final result = snapshot.data!.docs[index];
                        return Customerinfo(
                          collectionid: collectionsid.toString(),
                          sendtime: result['sendtime'].toString(),
                          last_msg: result['last_msg'].toString(),
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

class Customerinfo extends StatefulWidget {
  Customerinfo({
    super.key,
    required this.collectionid,
    required this.last_msg,
    required this.sendtime,
  });
  String collectionid;
  String last_msg;
  String sendtime;
  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {
  @override
  void initState() {
    super.initState();
    print(widget.collectionid);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('employe')
            .where('id', isEqualTo: widget.collectionid.toString())
            .snapshots(),
        builder: (context, snapshot) {
          // if (snapshot.data!.docs.isEmpty) {
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
                                      width: 50,
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
          // } else {
          //   return Center(
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text('There is no messages to be displayed'),
          //     ),
          //   );
          // }
        });
  }
}
