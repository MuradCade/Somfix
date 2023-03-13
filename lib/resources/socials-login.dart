import 'package:flutter/material.dart';

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
              onTap: () {},
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
              // google login
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: Image.asset(
                    'assets/google.png',
                    height: 28,
                  ),
                ),
              ),
              // facebook login
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: Image.asset(
                    'assets/facebook.png',
                    height: 28,
                  ),
                ),
              ),

              // twitter login
              SizedBox(
                width: 15,
              ),

              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: Image.asset(
                    'assets/twitter.png',
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
