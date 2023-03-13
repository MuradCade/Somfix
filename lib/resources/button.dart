import 'package:flutter/material.dart';

import '../data/login-auth.dart';

class LoginbtnGlobal extends StatelessWidget {
  LoginbtnGlobal({super.key, required this.btntextvalue});

  final String btntextvalue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print('Login Button');
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xFFF1E319D),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ],
        ),
        child: Text(
          btntextvalue,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}

class SignupbtnGlobal extends StatelessWidget {
  SignupbtnGlobal({
    super.key,
    required this.btntextvalue,
    required firstname,
    required lastname,
    required phone,
    required email,
    required pwd,
  });
  // String errormsg = '';
  final String btntextvalue;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Authtication authtication = Authtication();

    return InkWell(
      onTap: () async {
        String output = await authtication.SignupUser(
            firstname: firstname.text,
            lastname: lastname.text,
            phone: phone.text,
            email: email.text,
            password: pwd.text);
        if (output == "success") {
          print('keep going');
        } else {
          print(output);
        }
      },
      //   if (firstname == '') {
      //     errormsg = 'Firstname Field Is Empty';
      //   } else if (lastname == '') {
      //     errormsg = 'Lastname Field Is Empty';
      //   } else {}
      // },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xFFF1E319D),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ],
        ),
        child: Text(
          btntextvalue,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
