import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  // google signin
  Signinwithgoogle() async {
    try {
      // begun interactive signin in process
      final GoogleSignInAccount? getUser = await GoogleSignIn().signIn();
      if (getUser != null) {
        // obtain auth details from the request
        final GoogleSignInAuthentication getAuth =
            await getUser!.authentication;

        // create new credential for user
        final credential = GoogleAuthProvider.credential(
            accessToken: getAuth.accessToken, idToken: getAuth.idToken);

        // finally let user signin
        await FirebaseAuth.instance.signInWithCredential(credential);

        // restore user data in firestore
        FirebaseFirestore.instance.collection('userdata').add({
          "Email": getUser.email,
          "id": getUser.id,
          "role": 'personal',
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
