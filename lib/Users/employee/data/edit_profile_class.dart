import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Editprofiledata {
  Future<String> updatprofile({
    required String collectionid,
    required String fullname,
    required String age,
    required String phone,
    required String experience,
    required String country,
    required String address,
    required String service_category,
    required String profile_img,
    required String certificate,
  }) async {
    String output = 'Something went wrong';

    List selectservicecategory = [
      'empty',
      'Plumber',
      'Electrician',
      'Handyman',
      'Cleaner',
      'Painter'
    ];

    output = collectionid;
    try {
      await FirebaseFirestore.instance
          .collection('employe')
          .doc(collectionid)
          .update({
        "fullname": fullname,
        "profile_image": profile_img,
        "phone": phone,
        "age": age,
        "experience": experience,
        "country": country,
        "address": address,
        "certificate_url": certificate,
        "serivce_category":
            selectservicecategory[int.parse(service_category)].toString(),
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
