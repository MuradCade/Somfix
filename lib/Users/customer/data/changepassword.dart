import 'package:firebase_auth/firebase_auth.dart';

class Changepassword {
  Future<String> changesingleuserpassword({
    required String newpassword,
  }) async {
    // how change password works
    // get the current user id
    // get the new password fromthe onput
    final currentuser = FirebaseAuth.instance.currentUser;
    String output = 'Something went wrong';

    try {
      await currentuser!.updatePassword(newpassword);
      output = 'success';
    } on FirebaseAuthException catch (e) {
      output = e.message.toString();
    }

    return output;
  }
}
