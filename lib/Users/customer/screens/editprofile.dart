import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../resources/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/editprofile.class.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController countrycountroller = TextEditingController();
  TextEditingController citycountroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  String gender = '-1';
  final List image = [];
  final List updteimg = [];
  var imgpath;
  var imgname;
  final currentuserid = FirebaseAuth.instance.currentUser?.uid;
  Editprofiledetail updateprofile = Editprofiledetail();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('customer')
                  .where('id', isEqualTo: currentuserid.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                final result = snapshot.data?.docs.reversed.toList();
                final collectionid = snapshot.data?.docs[0].id;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                for (var result in result!) {
                  fullnamecontroller.text = result['fullname'];
                  phonecontroller.text = result['phone'];
                  agecontroller.text = result['age'];
                  if (result['gender'] == 'male') {
                    gender = '1';
                  } else if (result['gender'] == 'female') {
                    gender = '2';
                  } else {
                    gender = '-1';
                  }
                  countrycountroller.text = result['country'];
                  citycountroller.text = result['city'];
                  addresscontroller.text = result['address'];
                  updteimg.add(result['img']);

                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      // add (upload) image
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
                            SizedBox(
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('No Image Was Selected....'),
                                      ),
                                    );
                                    return null;
                                  }

                                  final path = results.files.single.path;
                                  final filename = results.files.single.name;
                                  // print('path' + path.toString());
                                  // print('filename' + filename.toString());
                                  image.add(path);
                                  image.add(filename);
                                },
                                child: Text('Browse...')),
                            SizedBox(width: 14),
                            Text(
                              'Choose Profile Picture',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.8),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Firstname textfield
                      TextFormGlobal(
                        controller: fullnamecontroller,
                        Textinputtype: TextInputType.text,
                        Obsecure: false,
                        hintext: 'Fullname',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // phine number
                      TextFormGlobal(
                        controller: phonecontroller,
                        Textinputtype: TextInputType.number,
                        Obsecure: false,
                        hintext: 'Phone',
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // age number
                      TextFormGlobal(
                        controller: agecontroller,
                        Textinputtype: TextInputType.number,
                        Obsecure: false,
                        hintext: 'Age',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //gender
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          padding: EdgeInsets.only(top: 3, left: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: DropdownButtonFormField(
                            value: gender,
                            items: [
                              const DropdownMenuItem(
                                child: Text('Select gender'),
                                value: "-1",
                              ),
                              const DropdownMenuItem(
                                child: Text('Male'),
                                value: "1",
                              ),
                              const DropdownMenuItem(
                                child: Text('Female'),
                                value: "2",
                              ),
                            ],
                            onChanged: (value) {
                              gender = value!;
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      // country
                      TextFormGlobal(
                        controller: countrycountroller,
                        Textinputtype: TextInputType.text,
                        Obsecure: false,
                        hintext: 'Country',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // city
                      TextFormGlobal(
                        controller: citycountroller,
                        Textinputtype: TextInputType.text,
                        Obsecure: false,
                        hintext: 'City',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // address
                      TextFormGlobal(
                        controller: addresscontroller,
                        Textinputtype: TextInputType.text,
                        Obsecure: false,
                        hintext: 'Address',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // email textfield

                      // Singup btn
                      InkWell(
                        onTap: () async {
                          if (image.isEmpty) {
                            final output = await updateprofile.editprofile(
                                img: updteimg[0].toString(),
                                fullname: fullnamecontroller.text,
                                phone: phonecontroller.text,
                                age: agecontroller.text,
                                gender: gender,
                                country: countrycountroller.text,
                                city: citycountroller.text,
                                address: addresscontroller.text,
                                collectionid: collectionid.toString());
                            if (output == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'profile updated successfully',
                                  style: TextStyle(
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
                                  output.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: const Duration(seconds: 1),
                              ));
                              Navigator.pop(context);
                            }
                          } else {
                            imgpath = image[0];
                            imgname = image[1];
                            final imgurl = await updateprofile.uploadProfileimg(
                                imgpath.toString(), imgname.toString());

                            final output = await updateprofile.editprofile(
                                img: imgurl.toString(),
                                fullname: fullnamecontroller.text,
                                phone: phonecontroller.text,
                                age: agecontroller.text,
                                gender: gender,
                                country: countrycountroller.text,
                                city: citycountroller.text,
                                address: addresscontroller.text,
                                collectionid: collectionid.toString());
                            // check the return of the function
                            if (output == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Pofile data updated successfuly',
                                  style: TextStyle(
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
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: const Duration(seconds: 1),
                              ));
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E319D),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),

                      // social media login
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }
                return Container();
              },
            )
          ],
        ),
      )),
    );
  }
}
