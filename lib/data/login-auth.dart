import 'package:firebase_auth/firebase_auth.dart';

class Authtication {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  Future<String> SignupUser({
    required String firstname,
    required String lastname,
    required String phone,
    required String email,
    required String password,
  }) async {
    firstname.trim();
    lastname.trim();

    phone.trim();
    email.trim();
    password.trim();

    String output = "Something Went Wrong";
    if (firstname != "" &&
        lastname != "" &&
        phone != "" &&
        email != "" &&
        password != "") {
      // function
      try {
        await firebaseauth.createUserWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      // error message
      output = "Please Fill The Field To Create Your Account";
    }
    return output;
  }

  Future<String> SignInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something Went Wrong";
    if (email != "" && password != "") {
      // function
      try {
        await firebaseauth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      // error message
      output = "Empty Email And Password Fields";
    }
    return output;
  }
  // error message intract bar
}
