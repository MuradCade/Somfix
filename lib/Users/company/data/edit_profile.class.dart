import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Editprofiledata {
  Future<String> updatprofile({
    required String collectionid,
    required String company_logo,
    required String company_name,
    required String ceoname,
    required String phone,
    required String address,
    required String country,
    required String description,
    // required String profile_img,
    // required String certificate,
  }) async {
    String output = 'Something went wrong';

    output = collectionid;
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(collectionid)
          .update({
        "company_logo": company_logo,
        "company_name": company_name,
        "company_ceo": ceoname,
        "company_phone": phone,
        "company_address": address,
        "company_country": country,
        "company_desc": description,
      });
      output = 'success';
    } catch (e) {
      output = e.toString();
    }
    return output;
  }

  //updload image and certificates
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
