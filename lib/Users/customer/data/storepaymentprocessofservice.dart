import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Paymentprocess {
  Future<String> storeservicepayment({
    required String servicename,
    required String serviceid,
    required String providerid,
    required String totalamount,
    required String date,
    required String time,
    required String paymentmethod,
    required String providerphone,
    required String clientphone,
    required String collectionid,
  }) async {
    List Paymentmethods = ['empty', 'Zaad', 'Cash', 'Edahab'];
    String output = 'Something went wrong';
    if (paymentmethod == '-1') {
      paymentmethod == '0';
    }

    try {
      final clientemail = FirebaseAuth.instance.currentUser?.email;
      FirebaseFirestore.instance.collection('payment').add({
        'serviceid': serviceid,
        'service_name': servicename,
        'service_provider': providerid,
        'client_email': clientemail.toString(),
        'total_amount': totalamount,
        'provider_phone_number': providerphone,
        'client_phone_number': clientphone,
        'payment_method': Paymentmethods[int.parse(paymentmethod)].toString(),
        'payment_status': 'Paid',
        'date': date,
        'time': time,
      });
      updatedbookedservicecollection(
          collectionid: collectionid,
          paymentmethod: Paymentmethods[int.parse(paymentmethod)].toString());
      output = 'success';
    } catch (e) {
      output = e.toString();
    }

    return output;
  }

  // update the bookedservice collection specifically payment status and payment methods
  Future<String> updatedbookedservicecollection({
    required final String collectionid,
    required final String paymentmethod,
  }) async {
    String output = 'Something went wrong';
    try {
      FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({
        'payment_method': paymentmethod,
        'payment_status': 'Payment Verified',
        'servicestatus': 'Verified'
      });
      output = 'success';
    } catch (error) {
      output = error.toString();
    }
    return output;
  }
}
