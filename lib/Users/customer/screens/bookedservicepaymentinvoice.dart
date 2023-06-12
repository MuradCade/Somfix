import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/storepaymentprocessofservice.dart';
import '../mainscreen.dart';

class Paymentprocedureinservicecompletion extends StatefulWidget {
  Paymentprocedureinservicecompletion({
    super.key,
    required this.serviceid,
    required this.servicename,
    required this.provideremail,
    required this.totalamount,
    required this.collectionid,
  });
  final String serviceid;
  final String servicename;
  final String provideremail;
  final String totalamount;
  final String collectionid;

  @override
  State<Paymentprocedureinservicecompletion> createState() =>
      _PaymentprocedureinservicecompletionState();
}

class _PaymentprocedureinservicecompletionState
    extends State<Paymentprocedureinservicecompletion> {
  String paymenttype = '-1';
  List datetimepicker = [];
  DateTime datetime = DateTime(2022, 02, 25, 12, 30);
  TextEditingController servicename = TextEditingController();
  TextEditingController totalamout = TextEditingController();
  TextEditingController providernumber = TextEditingController();
  TextEditingController clientnumber = TextEditingController();
  Paymentprocess storepaymentinvoiceindb = Paymentprocess();

  @override
  void initState() {
    super.initState();
    servicename.text = widget.servicename;
    totalamout.text = widget.totalamount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Process Payment'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Date & Time',
                style: TextStyle(fontSize: 17),
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

                    final String datepick = '${pickedDate?.year.toString()}' +
                        '-${pickedDate?.month.toString()}' +
                        '-${pickedDate?.day.toString()}';

                    datetimepicker.add(datepick);
                    // String formattedDate =
                    //     DateFormat('yyyy-MM-dd').format(pickedDate);
                    // print(pickedDate);
                    TimeOfDay? newtime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                            hour: datetime.hour, minute: datetime.minute));
                    datetimepicker.add(newtime?.format(context));
                  },
                  // r.add(newtime?.format(context));
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Service Name',
                style: TextStyle(fontSize: 17),
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
                  controller: servicename,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.design_services),
                    labelText: 'Service Name',
                  ),

                  // r.add(newtime?.format(context));
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Total Amount',
                style: TextStyle(fontSize: 17),
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
                  controller: totalamout,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.attach_money),
                    labelText: 'Total Amount',
                  ),

                  // r.add(newtime?.format(context));
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Payment Method',
                style: TextStyle(fontSize: 17),
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
                child: DropdownButtonFormField(
                  value: paymenttype,
                  items: const [
                    DropdownMenuItem(
                      value: '-1',
                      child: Text('Select Payment Method'),
                    ),
                    DropdownMenuItem(
                      value: "1",
                      child: Text('Zaad'),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text('Cash'),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text('Edahab'),
                    ),
                  ],
                  onChanged: (value) {
                    paymenttype = value!;
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Provder Phone Number',
                style: TextStyle(fontSize: 17),
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
                  controller: providernumber,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.call),
                    labelText: 'Provider Phone Number',
                  ),

                  // r.add(newtime?.format(context));
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Your Phone Number',
                style: TextStyle(fontSize: 17),
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
                  controller: clientnumber,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.call),
                    labelText: 'Your Phone Number',
                  ),

                  // r.add(newtime?.format(context));
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: InkWell(
                onTap: () async {
                  if (datetimepicker.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Pick Date & Time',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (servicename.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Enter Servicename',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (totalamout.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Enter Total Amount',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (paymenttype == '-1') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Choose Payment Method',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (providernumber.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Enter Provider Phone',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (clientnumber.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Enter Your Phone',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else {
                    String output =
                        await storepaymentinvoiceindb.storeservicepayment(
                            servicename: '${widget.servicename}',
                            serviceid: '${widget.serviceid}',
                            providerid: '${widget.provideremail}',
                            totalamount: totalamout.text,
                            date: datetimepicker[0].toString(),
                            time: datetimepicker[1].toString(),
                            paymentmethod: paymenttype,
                            clientphone: clientnumber.text,
                            providerphone: providernumber.text,
                            collectionid: '${widget.collectionid}'.toString());

                    if (output == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Payment Completed Successfully',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        duration: const Duration(seconds: 1),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Customermainscreen()));
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
                    // print('every thing looks good');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Save Payment Details',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
