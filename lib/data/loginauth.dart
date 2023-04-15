import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Authtication {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  Future<String> createaccount({
    required String firstname,
    required String lastname,
    required String phone,
    required String email,
    required String password,
    required String imageurl,
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
        String date = dateToday.toString().substring(0, 10);
        // final imageurl = uploadProfileimg(imgname, imgpath);
        // / add user detial with role
        storeuserinfofromsingupscreen(email, firstname, lastname, phone,
            storeroleresult[int.parse(role)], date, imageurl, uid);

        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please Fill The Form';
    }
    return output;
  }

// store profile img in firebase storage

  Future uploadProfileimg(String imgpath, String imgname) async {
    // get the refrence to storege root
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referencedirectory = referenceroot.child('images');

    // create refrence for image to be stored
    Reference refrenceimagetoupload = referencedirectory.child('${imgname}');
    String imageurl = '';
    try {
      // store image in firebase storage
      await refrenceimagetoupload.putFile(File(imgpath));
      imageurl = await refrenceimagetoupload.getDownloadURL();
      print('store successfully');
    } catch (error) {
      print('failed to store because of this problem : ' + error.toString());
    }

    return imageurl;
    // print('from function image path:  ${imgpath}');
    // print('from function image name:  ${imgname}');
  }

  // print();
// insert userdata to firestore when account is created
  Future storeuserinfofromsingupscreen(
      String email,
      String firstname,
      String lastname,
      String phone,
      String? role,
      String date,
      String imageurl,
      final uid) async {
    // print('function returned' + imageurl);

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
      "profile_image": imageurl,
    }).catchError((error) {
      print('Error found when adding data to userdata collection  : ' +
          error.toString());
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
