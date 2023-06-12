import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:somfixapp/Users/freelancer/screens/chatscreen.dart';

class Messageinbox extends StatefulWidget {
  const Messageinbox({super.key});

  @override
  State<Messageinbox> createState() => _MessageinboxState();
}

class _MessageinboxState extends State<Messageinbox> {
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
        automaticallyImplyLeading: true,
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
                    height: 700,
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
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

// Future<String> getcustomerfullnameandimage(String customerid) async {
//   String output = 'helo';
//   // final snapshot = await FirebaseFirestore.instance
//   //     .collection('customer')
//   //     .where('id', isEqualTo: customerid.toString())
//   //     .get()
//   //     .then((value) {
//   //   // output = document['fullname'];
//   //   output = value.docs.first['fullname'];
//   // });
//   print(customerid.toString());
//   // return print();
//   return output;
// }
