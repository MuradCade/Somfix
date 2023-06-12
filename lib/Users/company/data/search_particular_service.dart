import 'package:cloud_firestore/cloud_firestore.dart';

class Searchclass {
  Future searchsingleservice(String queryselector) async {
    await FirebaseFirestore.instance
        .collection('service')
        .where('Service_name', isEqualTo: queryselector)
        .get();

    // return search;
  }
}
