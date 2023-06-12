import 'package:cloud_firestore/cloud_firestore.dart';

class Bookedservice {
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
