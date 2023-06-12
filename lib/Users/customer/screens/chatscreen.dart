import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';

import '../data/message_class.dart';

class Chatscreen extends StatefulWidget {
  Chatscreen({super.key, this.providerid, this.providername});
  String? providername;
  String? providerid;
  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  TextEditingController message = TextEditingController();
  // Messageclass storemessage = Messageclass();
  final providerid = FirebaseAuth.instance.currentUser?.uid;
  Messages storemessagesindb = Messages();
  TimeOfDay currentTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    print('id ${widget.providerid}');
    print('id ${providerid}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.providername}'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            child: const Icon(
              Icons.call,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('massages')
                  .doc(providerid)
                  .collection('usermessages')
                  .doc(widget.providerid)
                  .collection('chat')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 800,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      // reverse: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool isme = snapshot.data!.docs[index]['senderid'] ==
                            providerid;
                        print(isme);
                        return Singlemsg(
                          message: snapshot.data!.docs[index]['massage'],
                          isme: isme,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          )
        ]),
      ),
      bottomSheet: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.indigo[400]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: message,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () async {
                    // await storemessage.storemessages(
                    //     message: message.text,
                    //     providerid: '${widget.providerid}'.toString());
                  },
                  child: InkWell(
                    onTap: () async {
                      String output = await storemessagesindb.storemessageses(
                          message: message.text,
                          customerid: "${widget.providerid}",
                          providerid: providerid.toString(),
                          currenttime: currentTime.format(context).toString());
                      if (output == 'success') {
                        print('Massage sent successfully');
                        message.text = '';
                      } else {
                        print(output);
                      }
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
                hintText: 'Write Massage',
                border: InputBorder.none,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class Singlemsg extends StatefulWidget {
  const Singlemsg({super.key, required this.message, required this.isme});
  final String message;
  final bool isme;

  @override
  State<Singlemsg> createState() => _SinglemsgState();
}

class _SinglemsgState extends State<Singlemsg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              widget.isme ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              constraints: BoxConstraints(maxWidth: 200),
              decoration: BoxDecoration(
                  color:
                      widget.isme ? Colors.indigo[600] : Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.message,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
