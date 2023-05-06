import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Authtication {
// login userwith email and password
  Future<String> login(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something Went Wrong";
    if (email != "" && password != "") {
      // function
      try {
        final user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

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

  // ?store profile img in firebase storage

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

  //? Create Personal Accoun

  Future<String> createpersonalaccount(
      {required String img,
      required String fullname,
      required String phone,
      required String age,
      required String gender,
      required String country,
      required String city,
      required String address,
      required String email,
      required String pwd}) async {
    String output = 'Something went wrong';
    // add selected gender inside the list
    List selectedgender = ['empty', 'male', 'female'];
    if (gender == '-1') {
      output = 'please choose gender to continue';
      gender = '0';
    }

    //  get the current date
    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    if (fullname != '' &&
        phone != '' &&
        age != '' &&
        country != '' &&
        city != '' &&
        address != '' &&
        email != '' &&
        pwd != '') {
      // excute the following code
      try {
        // 1- create user with email andpwd
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pwd);

        // 2- get the create user id
        final user = FirebaseAuth.instance.currentUser;
        final uid = user?.uid;

        // 3- store personal data of user in the cutomer collection
        await FirebaseFirestore.instance.collection('customer').add({
          "img": img,
          "fullname": fullname,
          "phone": phone,
          "age": age,
          "gender": selectedgender[int.parse(gender)],
          "country": country,
          "city": city,
          "address": address,
          "email": email,
          "id": uid,
          "created_date": date,
          "updated_date": false,
          "delete_status": false
        });

        //4- store user data to userdata collection(where will be determined the role of the user)
        storeuserinfofromsingupscreen(email, fullname, date, uid);

        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please Fill The Empty Fields';
    }

    return output;
  }
}

Future storeuserinfofromsingupscreen(
    String email, String fullname, String date, final uid) async {
  // print('function returned' + imageurl);

  await FirebaseFirestore.instance.collection('userdata').add({
    'id': uid,
    'fullname': fullname,
    "Email": email,
    "role": 'personal',
    "joined_date": date,
  }).catchError((error) {
    print('Error found when adding data to userdata collection  : ' +
        error.toString());
  });
}
