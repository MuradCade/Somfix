import 'package:flutter/material.dart';
import 'account_type.dart';
import '../data/checklogin.dart';
import '../data/personalaccountAuth.dart';
import '../data/signinwithgoogle.dart';
import '../resources/socials-login.dart';
import '../resources/textform.dart';
// import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;
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
        iconTheme: IconThemeData(
          color: Colors.transparent, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 160,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Login to your Account',
                style: TextStyle(
                    color: Color(0xFFF4F4F4F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 15,
              ),
              // Email textfield
              TextFormGlobal(
                controller: emailcontroller,
                Textinputtype: TextInputType.emailAddress,
                Obsecure: false,
                hintext: 'Email',
              ),
              SizedBox(
                height: 15,
              ),

              // Password Textfield
              TextFormGlobal(
                controller: pwdcontroler,
                Textinputtype: TextInputType.text,
                Obsecure: true,
                hintext: 'Password',
              ),
              SizedBox(
                height: 15,
              ),

              // Login btn
              InkWell(
                onTap: () async {
                  Future.delayed(Duration(seconds: 1));
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
                        style: TextStyle(
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
                    color: Color(0xFFF5f60ba),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: !isloading
                      ? Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )
                      : Center(
                          heightFactor: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              // Signin with google
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  google.Signinwithgoogle();
                },
                child: ScialmediaGlobal(),
              ),
              // forget password
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Don\'t have an account yet!',
                  style: TextStyle(fontSize: 15, color: Color(0xFFF4F4F4F)),
                ),
                SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccountType()));
                  },
                  child: Text(
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
