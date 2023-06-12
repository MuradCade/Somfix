import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Updateservicedata {
  Future<String> updatesignleservice({
    required String id,
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
    // get value from input
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
      // user email
      final email = FirebaseAuth.instance.currentUser?.email;

      try {
        // update single service data in firebase firestore db
        FirebaseFirestore.instance.collection('service').doc(id).update({
          "Service_image": serviceimage,
          "Service_name": servicename,
          "Service_category":
              servicecategorylist[int.parse(servicecategory)].toString(),
          "Service_address": serviceaddress,
          "Service_type": servicetypelist[int.parse(type)].toString(),
          "Service_status": statuslist[int.parse(status)].toString(),
          "Service_price": price,
          "Servicec_discount": discount,
          "Service_duration": durationandhour,
          "Service_description": description,
          "person_created_service": email
        });

        output = 'success';
      } catch (error) {
        output = error.toString();
      } // <-- Updated data
    }

    return output;
  }

  Future<String> deletesignleservice({required String id}) async {
    String output = "Something Went Wrong";

    try {
      // delete service from the firestore database
      FirebaseFirestore.instance.collection('service').doc(id).delete();
      output = "success";
    } catch (error) {
      output = error.toString();
    }

    return output;
  }
}
