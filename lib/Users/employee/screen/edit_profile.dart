import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/edit_profile_class.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  List image = [];
  List certificate = [];
  String servicetype = '-1';
  final currentuserid = FirebaseAuth.instance.currentUser!.uid;
  TextEditingController fullnamecontroler = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController expreincecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  List selectedservicetype = [
    'empty',
    'Plumber',
    'Electrician',
    'Handyman',
    'Cleaner',
    'Painter'
  ];
  Editprofiledata updateprofile = Editprofiledata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('employe')
                    .where('id', isEqualTo: currentuserid.toString())
                    .snapshots(),
                // initialData: initialData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  } else {
                    final result = snapshot.data!.docs.reversed.toList();
                    final collectionid = snapshot.data!.docs[0].id;

                    for (var result in result) {
                      // pass exsisting value into the update form
                      fullnamecontroler.text = result['fullname'];
                      agecontroller.text = result['age'];
                      phonecontroller.text = result['phone'];
                      expreincecontroller.text = result['experience'];
                      countrycontroller.text = result['country'];
                      addresscontroller.text = result['address'];

                      image.add(result['profile_image']);
                      certificate.add(result['certificate']);
                      if (result['service_type'].toString() ==
                          selectedservicetype[1]) {
                        servicetype = '1';
                      } else if (result['service_type'].toString() ==
                          selectedservicetype[2]) {
                        servicetype = '2';
                      } else if (result['service_type'].toString() ==
                          selectedservicetype[3]) {
                        servicetype = '3';
                      } else if (result['service_type'].toString() ==
                          selectedservicetype[4]) {
                        servicetype = '4';
                      } else if (result['service_type'].toString() ==
                          selectedservicetype[5]) {
                        servicetype = '5';
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 14,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      // on this button clicks run this code below
                                      FilePickerResult? results =
                                          await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.custom,
                                        allowedExtensions: ['png', 'jpg'],
                                      );
                                      if (results == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'No Image Was Selected....'),
                                          ),
                                        );
                                        return null;
                                      }

                                      final path = results.files.single.path;
                                      final filename =
                                          results.files.single.name;
                                      // print('path' + path.toString());
                                      // print('filename' + filename.toString());
                                      image.add(path);
                                      image.add(filename);
                                    },
                                    child: const Text('Browse...')),
                                const SizedBox(width: 14),
                                const Text(
                                  'Choose Profile Picture',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.8),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextFormField(
                              controller: fullnamecontroler,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Fullname',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextFormField(
                              controller: agecontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Age',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextFormField(
                              controller: phonecontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Phone',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextFormField(
                              controller: expreincecontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Exprience',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextFormField(
                              controller: countrycontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Country',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextFormField(
                              controller: addresscontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Address',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              padding: const EdgeInsets.only(top: 3, left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              child: DropdownButtonFormField(
                                value: servicetype,
                                items: [
                                  const DropdownMenuItem(
                                    child: Text('Select Service Type'),
                                    value: '-1',
                                  ),
                                  const DropdownMenuItem(
                                    child: Text('Plumber'),
                                    value: "1",
                                  ),
                                  const DropdownMenuItem(
                                    child: Text('Electrician'),
                                    value: "2",
                                  ),
                                  const DropdownMenuItem(
                                    child: Text('Handyman'),
                                    value: "3",
                                  ),
                                  const DropdownMenuItem(
                                    child: Text('Cleaner'),
                                    value: "4",
                                  ),
                                  const DropdownMenuItem(
                                    child: Text('Painter'),
                                    value: "5",
                                  ),
                                ],
                                onChanged: (value) {
                                  servicetype = value!;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 14,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      // on this button clicks run this code below
                                      FilePickerResult? results =
                                          await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.custom,
                                        allowedExtensions: ['png', 'jpg'],
                                      );
                                      if (results == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'No Image Was Selected....'),
                                          ),
                                        );
                                        return null;
                                      }

                                      final path = results.files.single.path;
                                      final filename =
                                          results.files.single.name;
                                      // print('path' + path.toString());
                                      // print('filename' + filename.toString());
                                      certificate.add(path);
                                      certificate.add(filename);
                                    },
                                    child: const Text('Browse...')),
                                const SizedBox(width: 14),
                                const Text(
                                  'Upload Certificate',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.8),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: InkWell(
                              onTap: () async {
                                if (image.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Add Profile Image',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (certificate.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Add Certificate',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (fullnamecontroler.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Empty Fullname Field ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (agecontroller.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Empty Age Field ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (phonecontroller.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Empty Phone Field ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (expreincecontroller.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Empty Experience Field ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (countrycontroller.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Empty Country Field ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (addresscontroller.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Empty Country Field ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else if (servicetype == '-1') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Please  Select Service Category ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
                                } else {
                                  // if (image[1].toString() == '' &&
                                  // certificate[1].toString() == '') {
                                  String output =
                                      await updateprofile.updatprofile(
                                          collectionid: collectionid.toString(),
                                          fullname: fullnamecontroler.text,
                                          age: agecontroller.text,
                                          phone: phonecontroller.text,
                                          experience: expreincecontroller.text,
                                          country: countrycontroller.text,
                                          address: addresscontroller.text,
                                          service_category: servicetype,
                                          profile_img: image[0].toString(),
                                          certificate:
                                              certificate[0].toString());

                                  if (output == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Profile Updated Successfully',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ));
                                    Navigator.pop(context);
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
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
