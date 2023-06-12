import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Addservice {
  // store service detail inside the firebase firestore
  Future<String> addservicecollection({
    required String serviceimage,
    required String servicename,
    required String servicecategory,
    required String serviceaddress,
    required String type,
    required String status,
    required String price,
    required String discount,
    required String durationandhour,
    required String description,
  }) async {
    String output = 'Something went wrong';
    // service type list
    List<String> servicecategorylist = [
      'empty',
      'Plumber',
      'Electrician',
      'Handyman',
      'Cleaner',
      'Painter'
    ];
    // service type
    List<String> servicetypelist = ['empty', 'Free', 'Fixed', 'Hourly'];
    //service status list
    List<String> statuslist = ['empty', 'Active', 'Inactive'];

    if (servicecategory == '-1') {
      servicecategory = '0';
    }
    if (type == '-1') {
      type = '0';
    }
    if (status == '-1') {
      status = '0';
    }

    if (servicename == '') {
      output = 'Please Enter Service Name';
    } else if (servicecategory == '0') {
      output = 'Please Choose Service Category';
    } else if (serviceaddress == '') {
      output = 'Please Enter Service Address';
    } else if (type == '0') {
      output = 'Please Choose  Type';
    } else if (status == '0') {
      output = 'Please Choose  Status';
    } else if (price == '') {
      output = 'Please Enter Price';
    } else if (discount == '') {
      output = 'Please Enter Discount';
    } else if (description == '') {
      output = 'Please Enter Discription';
    } else {
      try {
        final email = FirebaseAuth.instance.currentUser?.email;
        FirebaseFirestore.instance.collection('service').add({
          "Service_image": serviceimage,
          "Service_name": servicename,
          "Service_category": servicecategorylist[int.parse(servicecategory)],
          "Service_address": serviceaddress,
          "Service_type": servicetypelist[int.parse(type)],
          "Service_status": statuslist[int.parse(status)],
          "Service_price": price,
          "Service_discount": discount,
          "Service_duration": durationandhour,
          "Service_description": description,
          "person_created_service": email
        });
        output = 'success';
      } catch (e) {
        output = e.toString();
      }
    }

    return output;
  }

  // ?store service img in firebase storage

  Future uploadserviceimg(String imgpath, String imgname) async {
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
