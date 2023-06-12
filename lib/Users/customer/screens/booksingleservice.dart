import 'package:flutter/material.dart';

import '../data/bookservice_class.dart';
import '../mainscreen.dart';

class Booksingleservice extends StatefulWidget {
  Booksingleservice({
    required this.servicename,
    required this.serviceimg,
    required this.serviceprice,
    required this.servicediscount,
    required this.serviceprovideremail,
  });
  final String servicename;
  final String serviceimg;
  final String serviceprice;
  final String servicediscount;
  final String serviceprovideremail;

  @override
  State<Booksingleservice> createState() => _BooksingleserviceState();
}

class _BooksingleserviceState extends State<Booksingleservice> {
  DateTime datetime = DateTime(2022, 02, 25, 12, 30);
  List datetimepicker = [];
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
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

                                final String datepick =
                                    '${pickedDate?.year.toString()}' +
                                        '-${pickedDate?.month.toString()}' +
                                        '-${pickedDate?.day.toString()}';

                                datetimepicker.add(datepick);
                                // String formattedDate =
                                //     DateFormat('yyyy-MM-dd').format(pickedDate);
                                // print(pickedDate);
                                TimeOfDay? newtime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: datetime.hour,
                                        minute: datetime.minute));
                                datetimepicker.add(newtime?.format(context));

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
                            child: TextField(
                              controller: address,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
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
                            child: TextField(
                              controller: description,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
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
              if (datetimepicker.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Please Pick Date And Time',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  duration: Duration(seconds: 1),
                ));
              } else if (address.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Please Enter  Address',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  duration: Duration(seconds: 1),
                ));
              } else if (description.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Please Enter Description',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  duration: Duration(seconds: 1),
                ));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Secondpagebookingservice(
                            date: datetimepicker[0].toString(),
                            time: datetimepicker[1].toString(),
                            address: address.text,
                            desc: description.text,
                            servicename: '${widget.servicename}',
                            serviceimg: '${widget.serviceimg}',
                            serviceprice: '${widget.serviceprice}',
                            servicediscount: '${widget.servicediscount}',
                            serviceprovideremail:
                                '${widget.serviceprovideremail}')));
              }
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
  Secondpagebookingservice({
    super.key,
    required this.date,
    required this.time,
    required this.address,
    required this.desc,
    required this.servicename,
    required this.serviceimg,
    required this.serviceprice,
    required this.servicediscount,
    required this.serviceprovideremail,
  });
  final String date;
  final String time;
  final String address;
  final String desc;
  final String servicename;
  final String serviceimg;
  final String serviceprice;
  final String servicediscount;
  final String serviceprovideremail;

  @override
  State<Secondpagebookingservice> createState() =>
      _SecondpagebookingserviceState();
}

class _SecondpagebookingserviceState extends State<Secondpagebookingservice> {
  int quantity = 1;
  Bookservice bookservice = Bookservice();
  @override
  Widget build(BuildContext context) {
    // total variable calcualtes the price multiply quantity
    final int total = int.parse('${widget.serviceprice}') * quantity;
    final int totalamount = total - int.parse('${widget.servicediscount}');
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
                    padding: const EdgeInsets.all(
                      12.0,
                    ),
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
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
                              '${widget.servicename}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[50],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity--;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          child: const Icon(
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
                              color: Colors.indigo[100],
                              image: DecorationImage(
                                  image: NetworkImage('${widget.serviceimg}'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 12.0, top: 4, bottom: 4),
                    child: const Text(
                      'Booking Date & Time',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 249, 251, 252),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                'Date: ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${widget.date}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Time: ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${widget.time}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 12.0, top: 4, bottom: 4),
                    child: const Text(
                      'Price Details',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 251, 252),
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
                                  Text('\$ ${widget.serviceprice}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 6, top: 6),
                              child: const Divider(
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
                                  Text(
                                      '\$ ${widget.serviceprice} * ${quantity} = ${total} ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 6, top: 6),
                              child: const Divider(
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
                                  Text('\$ ${widget.servicediscount}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 6, top: 6),
                              child: const Divider(
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
                                  Row(
                                    children: [
                                      const Text('\$ ',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo)),
                                      Text('${totalamount}',
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo)),
                                    ],
                                  ),
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
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Disclaimer',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
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
            onTap: () async {
              // store the service inthe db
              String output = await bookservice.booksingleservice(
                servicename: '${widget.servicename}',
                serviceimg: '${widget.serviceimg}',
                quantity: quantity.toString(),
                date: '${widget.date}',
                time: '${widget.time}',
                price: '${widget.serviceprice}',
                totalamount: totalamount.toString(),
                discount: '${widget.servicediscount}',
                address: '${widget.address}',
                description: '${widget.desc}',
                provideremail: '${widget.serviceprovideremail}',
              );

              if (output == 'success') {
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
                        child: const Center(
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
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(color: Colors.indigo),
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
                                    const Text(
                                      'Date',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    const Text(
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
                                      widget.date,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      widget.time,
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
                                    const Text(
                                      'Total Amount',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      totalamount.toString(),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Customermainscreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.all(14),
                          child: const Text("Go To Home",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    output,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  duration: const Duration(seconds: 1),
                ));
              }
            },
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
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
