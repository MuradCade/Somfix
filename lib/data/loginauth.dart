import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authtication {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  Future<String> createaccount({
    required String firstname,
    required String lastname,
    required String phone,
    required String email,
    required String password,
    String role = '',
  }) async {
    firstname.trim();
    lastname.trim();
    phone.trim();
    email.trim();
    password.trim();
    String output = "Something went wront";
    List<String> storeroleresult = <String>[
      'personal',
      'company',
      'freelancer'
    ];

    // putting the value returned in parameter in list in indexizing way
    if (role == '-1') {
      role = '0';
    }

    if (firstname != '' &&
        lastname != '' &&
        phone != '' &&
        email != '' &&
        password != '') {
      try {
        await firebaseauth.createUserWithEmailAndPassword(
            email: email, password: password);
        final uid = FirebaseAuth.instance.currentUser!.uid;
        // print(role)
        // date
        DateTime dateToday = new DateTime.now();
        String date = dateToday
            .toString()
            .substring(0, 10); // / add user detial with role
        storeuserinfofromsingupscreen(email, firstname, lastname, phone,
            storeroleresult[int.parse(role)], date, uid);

        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please Fill The Form';
    }
    return output;
  }

// insert userdata to firestore when account is created
  Future storeuserinfofromsingupscreen(
      String email,
      String firstname,
      String lastname,
      String phone,
      String? role,
      String date,
      final uid) async {
    await FirebaseFirestore.instance.collection('userdata').add({
      'id': uid,
      'Firstname': firstname,
      "Lastname": lastname,
      "Phone": phone,
      "Email": email,
      "role": role,
      "joined_date": date,
      "deleted_date": 'false',
      "updated_date": 'false',
    }).catchError((error) {
      print('Error found when adding data to userdata collection  : ' + error);
    });
  }

// login class
  Future<String> login(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something Went Wrong";
    if (email != "" && password != "") {
      // function
      try {
        final user = await firebaseauth.signInWithEmailAndPassword(
            email: email, password: password);

        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      // error message
      output = "Empty Email And Password Fields";
    }
    return output;
  }

  //
}
