import 'package:flutter/material.dart';

import '../screens/bookservice.dart';

class Displaysignlecompanydetail extends StatefulWidget {
  Displaysignlecompanydetail(
      {super.key,
      required this.id,
      required this.fullname,
      required this.img,
      required this.phone,
      required this.email,
      required this.city,
      required this.address,
      required this.servicetype});
  final String id;
  final String fullname;
  final String img;
  final String phone;
  final String email;
  final String city;
  final String address;
  final String servicetype;

  @override
  State<Displaysignlecompanydetail> createState() =>
      _DisplaysignlecompanydetailState();
}

class _DisplaysignlecompanydetailState
    extends State<Displaysignlecompanydetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text(
        //   'Details',
        //   style: TextStyle(color: Colors.black, letterSpacing: 1.5),
        // ),
        toolbarHeight: 28,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      '${widget.img}',
                      // height: 0,
                      // width: 100,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          '${widget.fullname}'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Color(0xFFF273b69),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          'Active',
                          style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 24,
                        color: Color(0xFFF273b69),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.address},${widget.city}',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade600,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_purple500_outlined,
                        size: 24,
                        color: Color(0xFFF273b69),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        '0 (reviews)',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade600,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        size: 24,
                        color: Color(0xFFF273b69),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.phone}',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade600,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 24,
                        color: Color(0xFFF273b69),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Service Type: ${widget.servicetype}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFF273b69),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.message,
                            size: 24,
                            color: Color(0xFFFc5feed),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                            color: Color(0xFFF373737),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFF273b69),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.call,
                            size: 24,
                            color: Color(0xFFFc5feed),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Call',
                        style: TextStyle(
                            color: Color(0xFFF373737),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF273b69),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookingService()));
          },
          child: Center(
            child: Text('Book Now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
