import 'package:cloud_firestore/cloud_firestore.dart';

class Updateservicestatus {
  // update the bookedservice collection specifically payment status and payment methods
  Future<String> updateservicestatus({
    required final String collectionid,
    required final String status,
  }) async {
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

  Future<String> updateassignerresponse({
    required final String collectionid,
    required final String status,
    required final String servicestatus,
  }) async {
    String output = 'Something went wrong';
    try {
      FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update(
              {"assigner_response": status, "servicestatus": servicestatus});
      output = 'success';
    } catch (error) {
      output = error.toString();
    }
    return output;
  }
}
