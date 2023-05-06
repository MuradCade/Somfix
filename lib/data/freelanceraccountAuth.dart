import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FreelancerAuth {
  // ? upload imageprofile in firebase storage

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

  // ? upload sertificate in firebase storage
  Future uploadcertificate(String filepath, String filename) async {
    // get the refrence to storege root
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referencedirectory = referenceroot.child('images');

    // create refrence for image to be stored
    Reference refrenceimagetoupload = referencedirectory.child('${filename}');
    String imageurl = '';
    try {
      // store image in firebase storage
      await refrenceimagetoupload.putFile(File(filepath));
      imageurl = await refrenceimagetoupload.getDownloadURL();
      print('store successfully');
    } catch (error) {
      print('failed to store because of this problem : ' + error.toString());
    }

    return imageurl;
    // print('from function image path:  ${imgpath}');
    // print('from function image name:  ${imgname}');
  }

  // ? Store data to freelancer in employee collection

  Future<String> Storedatatoemployeecollection({
    required String img,
    required String fullname,
    required String phone,
    required String age,
    required String gender,
    required String country,
    required String city,
    required String address,
    required String certificate,
    required String experience,
    required String servicetype,
    required String email,
    required String pwd,
  }) async {
    String output = 'Something went wrong';
    //  get the current date
    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);

    // gender list the keyword empty use to check if the passed value is selected or not
    List selectedgender = ['empty', 'male', 'female'];
    // service type
    List selectedservicetype = [
      'empty',
      'Plumber',
      'Electrician',
      'Handyman',
      'Cleaner',
      'Painter'
    ];

    if (servicetype == '-1') {
      servicetype = '0';
    }
    if (servicetype == '0') {
      output = 'please choose service type';
      output = 'Please select service type';
    }
    if (gender == '-1') {
      gender = '0';
    }
    if (gender == '0') {
      output = 'Please select gender';
    }
    // phone != '' &&
    // age != '' &&
    // gender != '0' &&
    // country != '' &&
    // city != '' &&
    // address != '' &&
    // servicetype != '0' &&
    // certificate != '' &&
    // experience != '' &&
    // email != '' &&
    // pwd != ''
    if (fullname == '') {
      output = 'Empty Email Field';
    } else if (phone == '') {
      output = 'Empty Phone Field';
    } else if (age == '') {
      output = 'Empty age Field';
    } else if (gender == '0') {
      output = 'Please select gender';
    } else if (country == '') {
      output = 'Empty country Field';
    } else if (city == '') {
      output = 'Empty city Field';
    } else if (address == '') {
      output = 'Empty address Field';
    } else if (servicetype == '0') {
      output = 'Please select service type';
    } else if (experience == '') {
      output = 'Empty experience Field';
    } else if (email == '') {
      output = 'Empty email Field';
    } else if (pwd == '') {
      output = 'Empty password Field';
    } else {
      try {
        // 1- create user with email and password
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pwd);

        // get the created user id
        final uid = FirebaseAuth.instance.currentUser?.uid;

        // 2- store freelancer data in employe collection
        await FirebaseFirestore.instance.collection('employe').add({
          "profile_image": img,
          "fullname": fullname,
          "phone": phone,
          "age": age,
          "gender": selectedgender[int.parse(gender)].toString(),
          "country": country,
          "city": city,
          "address": address,
          "certificate_url": certificate,
          "servicetype": selectedservicetype[int.parse(servicetype)].toString(),
          "experience": experience,
          "email": email,
          "created_date": date,
          "updated_date": "false",
          "delete_status": "false",
          "id": uid
        });

        // 3- store freelancer (email,fullname,role) in userdata collection
        storeuserinfofromsingupscreen(email, fullname, date, uid);
        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    }

    return output;
  }

  // ? store small info (role ,id , fullname) of the freelancer user in userdata collection
  Future storeuserinfofromsingupscreen(
      String email, String fullname, String date, final uid) async {
    // print('function returned' + imageurl);

    await FirebaseFirestore.instance.collection('userdata').add({
      'id': uid,
      'fullname': fullname,
      "Email": email,
      "role": 'freelancer',
      "created_date": date,
    }).catchError((error) {
      print('Error found when adding data to userdata collection  : ' +
          error.toString());
      return error;
    });
  }
}
