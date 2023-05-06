import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import '../data/checklogin.dart';
import '../data/createcompany_auth.dart';

class Companymainscreen extends StatefulWidget {
  const Companymainscreen({super.key});

  @override
  State<Companymainscreen> createState() => _CompanymainscreenState();
}

class _CompanymainscreenState extends State<Companymainscreen> {
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController companycountrycontroller = TextEditingController();
  TextEditingController companyaddresscontroller = TextEditingController();
  TextEditingController companyphonecontroller = TextEditingController();
  TextEditingController companydescriptioncontroller = TextEditingController();
  TextEditingController companyceocontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final CreateCompany createcompany = CreateCompany();
  final List image = [];
  bool isloading = false;
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
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Create CompanyAccount',
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
                  SizedBox(height: 18),
                  // ?company name
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
                      controller: companynamecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Company Name ...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                      controller: companyphonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Company Phone ...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                      controller: companycountrycontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Company Country...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                      controller: companyaddresscontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Company Address ...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                      controller: companyceocontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Company Ceoname ...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 55,
                    padding: EdgeInsets.only(top: 10, left: 16),
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
                      maxLines: 150,
                      controller: companydescriptioncontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Enter Company Description ...',
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                        hintText: 'Enter Email ...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                      controller: passwordcontroller,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // create account btn
                  InkWell(
                    onTap: () async {
                      if (image.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Company Logo Required',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          duration: const Duration(seconds: 1),
                        ));
                      } else {
                        setState(() {
                          isloading = true;
                        });
                        Future.delayed(Duration(seconds: 2));
                        var imgpath = image[0];
                        var imgname = image[1];
                        final imageurl = await createcompany.uploadProfileimg(
                            imgpath, imgname);

                        String output = await createcompany.companycollection(
                            companyname: companynamecontroller.text,
                            companycountry: companycountrycontroller.text,
                            companyceo: companyceocontroller.text,
                            companyphone: companyphonecontroller.text,
                            companyaddress: companyaddresscontroller.text,
                            companydescription:
                                companydescriptioncontroller.text,
                            companyimg: imageurl.toString(),
                            email: emailcontroller.text,
                            password: passwordcontroller.text);
                        setState(() {
                          isloading = false;
                        });
                        if (output == 'success') {
                          // print(output);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Checklogin()));
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
                      padding: EdgeInsets.only(top: 3, left: 15),
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Color(0xFFF284bc1),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            )
                          ]),
                      child: Center(
                        child: !isloading
                            ? Text(
                                'Create Account',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    letterSpacing: 1.6,
                                    fontWeight: FontWeight.bold),
                              )
                            : Center(
                                heightFactor: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
