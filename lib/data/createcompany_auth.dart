import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateCompany {
//  /function that stores company data in company collection
  Future<String> companycollection(
      {required String companyname,
      required String companycountry,
      required String companyceo,
      required String companyphone,
      required String companyaddress,
      required String companydescription,
      required String companyimg,
      required String email,
      required String password}) async {
    String output = 'Something went wrong';
// get the current date
    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    try {
      if (companyname != '' &&
          companycountry != '' &&
          companyceo != '' &&
          companyphone != '' &&
          companyaddress != '' &&
          companydescription != '' &&
          email != '' &&
          password != '') {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // 2- get the create user id
        final uid = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseFirestore.instance.collection('company').add({
          "id": uid,
          "company_logo": companyimg,
          "company_name": companyname,
          "company_phone": companyphone,
          "company_country": companycountry,
          "company_address": companyaddress,
          "company_ceo": companyceo,
          "company_description": companydescription,
          "created_date": date,
          "email": email,
        }).catchError((error) {
          print(error);
        });

        storeuserinfofromsingupscreen(email, companyname, date, uid);

        output = 'success';
      }
    } on FirebaseAuthException catch (e) {
      output = e.message.toString();
    }

    return output;
  }

  // ?store profile img in firebase storage

  Future uploadProfileimg(String imgpath, String imgname) async {
    // get the refrence to storege root
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referencedirectory = referenceroot.child('images');

    // create refrence for image to be stored
    Reference refrenceimagetoupload = referencedirectory.child('${imgname}');
    String imageurl = '';
    try {
      // store image in firebase storage
      await refrenceimagetoupload.putFile(File(imgpath));
      imageurl = await refrenceimagetoupload.getDownloadURL();
      print('store successfully');
    } catch (error) {
      print('failed to store because of this problem : ' + error.toString());
    }

    return imageurl;
    // print('from function image path:  ${imgpath}');
    // print('from function image name:  ${imgname}');
  }

  Future storeuserinfofromsingupscreen(
      String email, String fullname, String date, final uid) async {
    // print('function returned' + imageurl);

    await FirebaseFirestore.instance.collection('userdata').add({
      'id': uid,
      'companyfullname': fullname,
      "Email": email,
      "role": 'company',
      "joined_date": date,
    }).catchError((error) {
      print('Error found when adding data to userdata collection  : ' +
          error.toString());
    });
  }
}
