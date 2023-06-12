import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/edit_profile.class.dart';
// import '../data/edit_profile_class.dart';

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
  TextEditingController companyname = TextEditingController();
  TextEditingController companyceoname = TextEditingController();
  TextEditingController companyphone = TextEditingController();
  TextEditingController companyaddress = TextEditingController();
  TextEditingController companycountry = TextEditingController();
  TextEditingController companydescription = TextEditingController();

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
                    .collection('company')
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
                      image.add(result['company_logo']);
                      companyname.text = result['company_name'].toString();
                      companyceoname.text = result['company_ceo'].toString();
                      companyphone.text = result['company_phone'].toString();
                      companyaddress.text =
                          result['company_address'].toString();
                      companycountry.text =
                          result['company_country'].toString();
                      companydescription.text =
                          result['company_description'].toString();
                      // pass exsisting value into the update form
                      // fullnamecontroler.text = result['fullname'];
                      // agecontroller.text = result['age'];
                      // phonecontroller.text = result['phone'];
                      // expreincecontroller.text = result['experience'];
                      // countrycontroller.text = result['country'];
                      // addresscontroller.text = result['address'];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      image.add(path);
                                      image.add(filename);
                                    },
                                    child: const Text('Browse...')),
                                const SizedBox(width: 14),
                                const Text(
                                  'Choose Company Logo',
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
                              controller: companyname,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Company Name',
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
                              controller: companyceoname,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Company Ceoname',
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
                              controller: companyphone,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Company Phone',
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
                              controller: companyaddress,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Company Address',
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
                              controller: companycountry,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Company Country',
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: companydescription,
                                keyboardType: TextInputType.number,
                                maxLines: 190,
                                decoration: const InputDecoration(
                                  hintText: 'Company Description',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(height: 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: InkWell(
                              onTap: () async {
                                if (image.isNotEmpty &&
                                    companyname.text != '' &&
                                    companyceoname.text != '' &&
                                    companyphone.text != '' &&
                                    companyaddress.text != '' &&
                                    companycountry.text != '' &&
                                    companydescription.text != '') {
                                  if (image.asMap().containsKey(1)) {
                                    // excute the update without updating the image
                                    final String output =
                                        await updateprofile.updatprofile(
                                            collectionid:
                                                collectionid.toString(),
                                            company_logo: image[0],
                                            company_name: companyname.text,
                                            ceoname: companyceoname.text,
                                            phone: companyphone.text,
                                            address: companyaddress.text,
                                            country: companycountry.text,
                                            description:
                                                companydescription.text);

                                    if (output == 'success') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Company Profile Updated Successfully',
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
                                          output.toString(),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ));
                                    }
                                  } else {
                                    // update profile with new added image (company_logo)
                                    final imagepath = image[0];
                                    final imagename = image[1];

                                    final imageurl = await updateprofile
                                        .uploadProfileimg(imagepath, imagename);
                                    final String output =
                                        await updateprofile.updatprofile(
                                            collectionid:
                                                collectionid.toString(),
                                            company_logo: imageurl.toString(),
                                            company_name: companyname.text,
                                            ceoname: companyceoname.text,
                                            phone: companyphone.text,
                                            address: companyaddress.text,
                                            country: companycountry.text,
                                            description:
                                                companydescription.text);

                                    if (output == 'success') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Company Profile Updated Successfully',
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
                                          output.toString(),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ));
                                    }
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Please Fill The Form Correctly',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ));
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
                          const SizedBox(
                            height: 12,
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
