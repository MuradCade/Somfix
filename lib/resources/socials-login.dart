import 'package:flutter/material.dart';

import '../mainscreens/forgetpwd.dart';

class ScialmediaGlobal extends StatefulWidget {
  const ScialmediaGlobal({super.key});

  @override
  State<ScialmediaGlobal> createState() => _ScialmediaGlobalState();
}

class _ScialmediaGlobalState extends State<ScialmediaGlobal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Forgetpwd()));
              },
              child: Text(
                'Forget Password',
                style: TextStyle(
                    color: Color(0xFFF1E319D),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            '- Or sign in with - ',
            style: TextStyle(
                color: Color(0xFFF4F4F4F),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              // google login btn
              Container(
                width: 299,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Image.asset(
                        'assets/google.png',
                        height: 28,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Continue With Google',
                          style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),
              ),
              // facebook login
              SizedBox(
                width: 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
