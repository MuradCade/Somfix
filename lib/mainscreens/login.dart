import 'package:flutter/material.dart';
import 'account_type.dart';
import '../data/checklogin.dart';
import '../data/personalaccountAuth.dart';
import '../data/signinwithgoogle.dart';
import '../resources/socials-login.dart';
import '../resources/textform.dart';
import 'forgetpwd.dart';
// import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroler = TextEditingController();
  // instace of class called auth inside login-auth.dart file
  Authtication auth = Authtication();
  // login with google class
  final AuthService google = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.transparent, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 160,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Login to your Account',
                style: TextStyle(
                    color: Color(0xFFF4F4F4F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5),
              ),
              const SizedBox(
                height: 15,
              ),
              // Email textfield
              TextFormGlobal(
                controller: emailcontroller,
                Textinputtype: TextInputType.emailAddress,
                Obsecure: false,
                hintext: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),

              // Password Textfield
              TextFormGlobal(
                controller: pwdcontroler,
                Textinputtype: TextInputType.text,
                Obsecure: true,
                hintext: 'Password',
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 210),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Forgetpwd()));
                  },
                  child: const Text(
                    'Forget Password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Login btn
              InkWell(
                onTap: () async {
                  String output = await auth.login(
                      email: emailcontroller.text, password: pwdcontroler.text);

                  if (output == 'success') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Checklogin()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        output,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5f60ba),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
              // Signin with google

              // forget password
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Don\'t have an account yet?',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 18, 18, 18)),
                ),
                const SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountType()));
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFF1E319D),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          ),
        ),
      )),
    );
  }
}
