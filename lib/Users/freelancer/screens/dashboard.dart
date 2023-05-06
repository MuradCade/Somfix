import 'package:flutter/material.dart';
import '../messages.dart';
import '../notification.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var date = DateTime.now();
  // associative array daysofthe week
  var daysoftheweek = {
    "1": "Monday ",
    '2': 'Tuesday ',
    '3': 'Wednesday ',
    '4': 'Thursday ',
    '5': 'Friday',
    '6': 'Saturday',
    '7': 'Sunday'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color of the screen
      backgroundColor: Color(0xFFFffffff),
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          Messageinbox(),
          MyNotification(),
        ],
      ),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Welcome To Freelancer Dashboard',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFF2f3034),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Card(
                    color: Color(0xFFFf2f2f2),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Provider Type: ',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 17,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                ' Freelancer',
                                style: TextStyle(
                                    color: Color(0xFFF2f3034),
                                    fontSize: 17,
                                    letterSpacing: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Current Day: ',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 17,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                daysoftheweek['${date.weekday}'].toString(),
                                style: TextStyle(
                                    color: Color(0xFFF2f3034),
                                    fontSize: 17,
                                    letterSpacing: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //? cards , total booking ,services etc
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: [
                      // ! card 1
                      Card(
                        child: Column(
                          children: [
                            Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 12, top: 18),
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 12, top: 18),
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Card(
                                              color: Colors.white,
                                              child: Icon(
                                                Icons.ac_unit_rounded,
                                                size: 22,
                                                color: Color(0xFFF5f60ba),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 38),
                                      child: Text(
                                        'Total Booking',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // ! card 2
                      Card(
                        child: Column(
                          children: [
                            Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 12, top: 18),
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 12, top: 18),
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Card(
                                              color: Colors.white,
                                              child: Icon(
                                                Icons.article,
                                                size: 22,
                                                color: Color(0xFFF5f60ba),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 38),
                                      child: Text(
                                        'Total Service',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // ! card 3
                      Card(
                        child: Column(
                          children: [
                            Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 12, top: 18),
                                          child: Text(
                                            '\$0',
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 12, top: 18),
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Card(
                                              color: Colors.white,
                                              child: Icon(
                                                Icons.payment,
                                                size: 22,
                                                color: Color(0xFFF5f60ba),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 38),
                                      child: Text(
                                        'Total Earning',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // ! card 4
                      Card(
                        child: Column(
                          children: [
                            Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 12, top: 18),
                                          child: Text(
                                            '\$0',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 12, top: 10),
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Card(
                                              color: Colors.white,
                                              child: Icon(
                                                Icons.credit_card,
                                                size: 22,
                                                color: Color(0xFFF5f60ba),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 38),
                                      child: Text(
                                        'Wallet Detail',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Text(
                            'My Services',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          )),
                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFFF5f60ba),
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: Text(
                      'There Is No Service To Be Displayed',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
