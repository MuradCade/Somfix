import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wallethistory extends StatefulWidget {
  const Wallethistory({super.key});

  @override
  State<Wallethistory> createState() => _WallethistoryState();
}

class _WallethistoryState extends State<Wallethistory> {
  final currentuseremail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet History'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('payment')
                    .where('client_email', isEqualTo: currentuseremail)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('There Is No Record To Be Displayed'),
                      );
                    } else {
                      return SizedBox(
                          height: 9000,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              final result = snapshot.data!.docs[index];
                              if (result['payment_status'] == 'Paid') {
                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo[50],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10, top: 14),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                result['service_name'],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '\$' +
                                                      result['total_amount']
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                'Date',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                result['date'],
                                                style: TextStyle(
                                                    color: Colors.indigo,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Payment',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  result['payment_method'],
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      'Wallet Is Empty',
                                      style: TextStyle(
                                          color: Colors.indigo[600],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                );
                              }
                            },
                          ));
                    }
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
