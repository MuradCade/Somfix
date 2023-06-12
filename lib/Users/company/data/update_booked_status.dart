import 'package:cloud_firestore/cloud_firestore.dart';

class Bookedservice {
  Future<String> updateservicedata(
      {required final String collectionid,
      required final String status}) async {
    String output = 'Something went wrong';
    try {
      FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({
        "servicestatus": status,
      });
      output = 'success';
    } catch (error) {
      output = error.toString();
    }
    return output;
  }
}
