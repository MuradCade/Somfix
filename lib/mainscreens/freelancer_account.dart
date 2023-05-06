import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../data/checklogin.dart';
import '../data/freelanceraccountAuth.dart';

class Freelancercreateaccount extends StatefulWidget {
  const Freelancercreateaccount({super.key});

  @override
  State<Freelancercreateaccount> createState() =>
      _FreelancercreateaccountState();
}

class _FreelancercreateaccountState extends State<Freelancercreateaccount> {
  final List image = [];
  final List certificate = [];
  String gender = '-1';
  String servicetype = '-1';
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  FreelancerAuth freelanceauth = FreelancerAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 3),
              alignment: Alignment.topLeft,
              child: Text(
                'Create Freelancer Account',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF181d2b),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // ?form start here
            // ?profile image
            SizedBox(
              height: 14,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                              content: Text('No Image Was Selected....'),
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
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                controller: fullnamecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Fullname',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                decoration: InputDecoration(
                  hintText: 'Phone',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                decoration: InputDecoration(
                  hintText: 'Age',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                      value: '-1',
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
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Country',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                controller: citycontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'City',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                          allowedExtensions: ['png', 'jpg', 'docs', 'pdf'],
                        );
                        if (results == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No Image Was Selected....'),
                            ),
                          );
                          return null;
                        }

                        final path = results.files.single.path;
                        final filename = results.files.single.name;
                        // print('path' + path.toString());
                        // print('filename' + filename.toString());
                        certificate.add(path);
                        certificate.add(filename);
                      },
                      child: Text('Browse...')),
                  SizedBox(width: 14),
                  Text(
                    'Add Certificate',
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
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                controller: experiencecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Experience',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

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
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.only(top: 3, left: 15),
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
                obscureText: true,
                controller: pwdcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                if (image.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Please select profile image",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    duration: const Duration(seconds: 1),
                  ));
                } else if (certificate.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Please select Certifcate (image,pdf,word)",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    duration: const Duration(seconds: 1),
                  ));
                } else {
                  var imgpath = image[0];
                  var imgname = image[1];
                  var certfpath = certificate[0];
                  var certfname = certificate[1];

                  // get the url of uploaded image
                  final imageurl =
                      await freelanceauth.uploadProfileimg(imgpath, imgname);

                  // get the url of uploaded certifcate
                  final certificateurl = await freelanceauth.uploadcertificate(
                      certfpath, certfname);

                  String output =
                      await freelanceauth.Storedatatoemployeecollection(
                          img: imageurl,
                          fullname: fullnamecontroller.text,
                          phone: phonecontroller.text,
                          age: agecontroller.text,
                          gender: gender,
                          country: countrycontroller.text,
                          city: citycontroller.text,
                          address: addresscontroller.text,
                          certificate: certificateurl,
                          experience: experiencecontroller.text,
                          servicetype: servicetype,
                          email: emailcontroller.text,
                          pwd: pwdcontroller.text);
                  if (output == 'success') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Checklogin()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        output,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  }
                }
              },
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
                  'Create Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
