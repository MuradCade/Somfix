import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Bookservice {
// book service

  Future<String> booksingleservice({
    required final String servicename,
    required final String serviceimg,
    required final String quantity,
    required final String date,
    required final String time,
    required final String price,
    required final String totalamount,
    required final String discount,
    required final String address,
    required final String description,
    required final String provideremail,
  }) async {
    final int serviceid;
    final String status = 'Pending';
    String output = 'Something went wrong!';
    final clientid = await FirebaseAuth.instance.currentUser?.uid;

    Random random = Random();
    serviceid = random.nextInt(50);

    // String output =
    try {
      await FirebaseFirestore.instance.collection('bookedservices').add({
        "service_name": servicename,
        "service_img": serviceimg,
        "date": date,
        "time": time,
        "quantity": quantity,
        "price": price,
        "totalamount": totalamount,
        "discount": discount,
        "address": address,
        "description": description,
        "client_id": clientid,
        "provideremail": provideremail,
        "servicestatus": status,
        "service_id": serviceid,
        'payment_method': 'unverified',
        'payment_status': 'unverified',
        'assignstatus': 'false',
        'assignedtoemail': 'null',
        'assigner_response': 'null',
      });
      output = 'success';
    } catch (error) {
      output = error.toString();
    }

    return output;
  }

  Future<String> updateservicedata({
    required final String collectionid,
    required final String date,
    required final String time,
    required final String address,
    required final String description,
  }) async {
    String output = 'Something went wrong';
    try {
      FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({
        'date': date,
        'time': time,
        'address': address,
        'description': description,
      });
      output = 'success';
    } catch (error) {
      output = error.toString();
    }
    return output;
  }

  Future<String> deletesignleservice({required String id}) async {
    String output = "Something Went Wrong";

    try {
      // delete booked service from the firestore database
      FirebaseFirestore.instance.collection('bookedservices').doc(id).delete();
      output = "success";
    } catch (error) {
      output = error.toString();
    }

    return output;
  }

// update the status of the booked service if clicked cancel
// only change the status and don't delete the booked service data
  Future<String> changestatustoaccepted(
      {required String collectionid, required String datapassed}) async {
    String output = 'Something went wrong';

    try {
      await FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({'servicestatus': datapassed});
      output = 'success';
    } catch (e) {
      output = e.toString();
    }

    return output;
  }

  Future<String> changestatustocancel(
      {required String collectionid, required String datapassed}) async {
    String output = 'Something went wrong';

    try {
      await FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({'servicestatus': datapassed});
      output = 'success';
    } catch (e) {
      output = e.toString();
    }

    return output;
  }

  Future<String> changestatustocompleted(
      {required String collectionid, required String datapassed}) async {
    String output = 'Something went wrong';

    try {
      await FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({'servicestatus': datapassed});
      output = 'success';
    } catch (e) {
      output = e.toString();
    }

    return output;
  }
}
