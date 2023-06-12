import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Editprofiledetail {
  Future editprofile({
    required String img,
    required String fullname,
    required String phone,
    required String age,
    required String gender,
    required String country,
    required String city,
    required String address,
    required String collectionid,
  }) async {
    String output = 'something went wrong';
    List genders = ['empty', 'male', 'female'];
    if (gender == '-1') {
      gender = '0';
    }
    try {
      FirebaseFirestore.instance
          .collection('customer')
          .doc(collectionid)
          .update({
        "fullname": fullname,
        "img": img,
        "phone": phone,
        "age": age,
        "gender": genders[int.parse(gender)],
        "country": country,
        "city": city,
        "address": address,
      });
      output = 'success';
    } catch (e) {
      output = e.toString();
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
}
