import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  Future<String> storemessageses({
    required String message,
    // message reciever
    required String customerid,
    // message sender
    required String providerid,
    required String currenttime,
  }) async {
    String output = 'Something went wrong';
    // 1- create collection call messages and specifying collection id
    //store messagedata in flutter

    try {
      await FirebaseFirestore.instance
          .collection('massages')
          .doc(providerid)
          .collection('usermessages')
          .doc(customerid)
          .collection('chat')
          .add({
        "senderid": providerid,
        "receiverid": customerid,
        "massage": message,
        "status": 'waiting',
        "currenttime": currenttime
      }).then((value) {
        FirebaseFirestore.instance
            .collection('massages')
            .doc(providerid)
            .collection('usermessages')
            .doc(customerid)
            .set({'last_msg': message, 'sendtime': currenttime});
      });

      await FirebaseFirestore.instance
          .collection('massages')
          .doc(customerid)
          .collection('usermessages')
          .doc(providerid)
          .collection('chat')
          .add({
        "senderid": customerid,
        "receiverid": providerid,
        "massage": message,
        "status": 'waiting',
        "currenttime": currenttime
      }).then(
        (value) {
          FirebaseFirestore.instance
              .collection('massages')
              .doc(customerid)
              .collection('usermessages')
              .doc(providerid)
              .set({'last_msg': message, 'sendtime': currenttime});
        },
      );
      output = 'success';
    } catch (e) {
      output = e.toString();
    }
    return output;
  }
}
