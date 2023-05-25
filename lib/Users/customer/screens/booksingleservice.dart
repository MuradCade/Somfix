import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Booksingleservice extends StatefulWidget {
  const Booksingleservice({super.key});

  @override
  State<Booksingleservice> createState() => _BooksingleserviceState();
}

class _BooksingleserviceState extends State<Booksingleservice> {
  DateTime datetime = DateTime(2022, 02, 25, 12, 30);
  List datetimepicker = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Book Service',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          toolbarHeight: 70,
          backgroundColor: const Color(0xFFF5f60ba),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Step 1',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 46,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Step 2',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Enter Detail Information',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    height: 440,
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 12),
                          child: const Text(
                            'Date And Time',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, left: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.calendar_today),
                                labelText: 'Enter date and time',
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));
                                // String formattedDate =
                                //     DateFormat('yyyy-MM-dd').format(pickedDate);
                                // print(pickedDate);
                                TimeOfDay? newtime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: datetime.hour,
                                        minute: datetime.minute));
                                print(newtime);
                                // datetimepicker.add(newtime?.format(context));
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 12),
                          child: const Text(
                            'Your Address',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, left: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.location_on),
                                labelText: 'Enter your address',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 12),
                          child: const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter description',
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Secondpagebookingservice()));
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ));
  }
}

// second booking page

class Secondpagebookingservice extends StatefulWidget {
  const Secondpagebookingservice({super.key});

  @override
  State<Secondpagebookingservice> createState() =>
      _SecondpagebookingserviceState();
}

class _SecondpagebookingserviceState extends State<Secondpagebookingservice> {
  final String num = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Book Service',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          toolbarHeight: 70,
          backgroundColor: const Color(0xFFF5f60ba),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Step 1',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              color: Colors.indigo[100],
                              fontSize: 46,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF5f60ba),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Step 2',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 249, 251, 252),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Servicename',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 75,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[100],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                      Text(num),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_drop_up,
                                            color: Colors.indigo,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.0, top: 4, bottom: 4),
                    child: Text(
                      'Price Details',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                    // child: Divider(
                    //   color: Color.fromARGB(252, 255, 252, 252),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 249, 251, 252),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 12),
                              padding: const EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  const Text('\$23',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 6),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 12),
                              padding: const EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Subtotal',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  const Text('\$23 * 1 = \$23',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 6),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 12),
                              padding: const EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Discount',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  const Text('\$2',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 6),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 12),
                              padding: const EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Payment',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  const Text('\$23',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Disclaimer',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You will be asked for payment once your booking is completed.',
                          maxLines: 2,
                          style: TextStyle(fontSize: 16, height: 1.2),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // store the service inthe db
              // once service is booked once then the client don't have ability to book it if the
              // first booking didn't compeleted

              // show th dailog box that conforms the service is booked
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  icon: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                  ),
                  title: Column(
                    children: [
                      const Text(
                        "Thank You!",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Your booking is confirmed",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.indigo),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '22 May, 2023',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    '03:51 PM',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ]),
                            const SizedBox(
                              height: 24,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    '\$26.00',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ])
                          ],
                        ),
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Go To Home",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.indigo,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Go To Review",
                            style: TextStyle(color: Colors.indigo)),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ));
  }
}
