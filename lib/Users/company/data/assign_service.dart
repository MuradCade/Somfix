import 'package:cloud_firestore/cloud_firestore.dart';

class AssignService {
  Future<String> assignsingleservice(
      {required final String collectionid,
      required final String assignsertvicetoemail}) async {
    String output = 'Something went wrong';
    try {
      FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({
        "assignstatus": 'true',
        "assignedtoemail": assignsertvicetoemail,
        "servicestatus": 'Assigned',
      });
      output = 'success';
    } catch (error) {
      output = error.toString();
    }
    // print('collection id' + collectionid.toString());
    return output;
  }

  Future<String> re_assignsingleservice(
      {required final String collectionid,
      required final String assignsertvicetoemail}) async {
    String output = 'Something went wrong';
    try {
      FirebaseFirestore.instance
          .collection('bookedservices')
          .doc(collectionid)
          .update({
        // "assignstatus": 'true',
        "assignedtoemail": assignsertvicetoemail,
        "servicestatus": 'Re-Assigned',
      });
      output = 'success';
    } catch (error) {
      output = error.toString();
    }
    // print('collection id' + collectionid.toString());
    return output;
  }
}
