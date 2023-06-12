import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/locale.dart';
import 'package:flutter/material.dart';

class Messages {
  Future<String> storemessageses({
    required String message,
    // message reciever
    required String friend,
    // message sender
    required String currentuser,
    required String currenttime,
  }) async {
    String output = 'Something went wrong';
    // 1- create collection call messages and specifying collection id
    //store messagedata in flutter

    try {
      await FirebaseFirestore.instance
          .collection('massages')
          .doc(currentuser)
          .collection('usermessages')
          .doc(friend)
          .collection('chat')
          .add({
        "senderid": currentuser,
        "receiverid": friend,
        "massage": message,
        "date": DateTime.now(),
        "currenttime": currenttime
      }).then((value) {
        FirebaseFirestore.instance
            .collection('massages')
            .doc(currentuser)
            .collection('usermessages')
            .doc(friend)
            .set({'last_msg': message, 'sendtime': currenttime});
      });

      await FirebaseFirestore.instance
          .collection('massages')
          .doc(friend)
          .collection('usermessages')
          .doc(currentuser)
          .collection('chat')
          .add({
        "senderid": currentuser,
        "receiverid": friend,
        "massage": message,
        "date": DateTime.now(),
        "currenttime": currenttime
      }).then(
        (value) {
          FirebaseFirestore.instance
              .collection('massages')
              .doc(friend)
              .collection('usermessages')
              .doc(currentuser)
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
