import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/bookservice_class.dart';
import 'bookedservicepaymentinvoice.dart';
import 'bookingdetails.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  String filter = '-1';
  List datetimepicker = [];
  DateTime datetime = DateTime(2022, 02, 25, 12, 30);
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  Bookservice updatebookedservice = Bookservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Booking'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
        actions: const [],
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: double.infinity,
                  height: 58,
                  padding: const EdgeInsets.only(top: 3, left: 15),
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
                    value: filter,
                    items: const [
                      DropdownMenuItem(
                        value: '-1',
                        child: Text('Service Category'),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text('Plumber'),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text('Electrician'),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text('Handyman'),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text('Cleaner'),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text('Painter'),
                      ),
                    ],
                    onChanged: (value) {
                      filter = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bookedservices')
                    .where('client_id',
                        isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Wrap(children: [
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final result = snapshot.data!.docs[index];
                              final collectionid =
                                  snapshot.data!.docs[index].id;
                              final String serviceid =
                                  result['service_id'].toString();
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Bookingdetailpage(
                                                    service_id: serviceid)));
                                  },
                                  child: Container(
                                    width: 600,
                                    height: 450,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 7,
                                          )
                                        ],
                                        border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFFfefefe),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // booking img
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.indigo[50],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              result[
                                                                  'service_img']),
                                                          fit: BoxFit.cover)),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: result['servicestatus'].toString() == 'Pending'
                                                                  ? Colors.red[50]
                                                                  : result['servicestatus'].toString() == 'Cancelled'
                                                                      ? Colors.red[50]
                                                                      : result['servicestatus'].toString() == 'Accepted'
                                                                          ? Colors.green[50]
                                                                          : result['servicestatus'].toString() == 'Completed'
                                                                              ? Colors.green[50]
                                                                              : result['servicestatus'].toString() == 'Verified'
                                                                                  ? Colors.green[50]
                                                                                  : result['servicestatus'].toString() == 'Assigned'
                                                                                      ? Colors.green[50]
                                                                                      : result['servicestatus'].toString() == 'Started'
                                                                                          ? Colors.red[50]
                                                                                          : result['servicestatus'].toString() == 'Re-Assigned'
                                                                                              ? Colors.green[50]
                                                                                              : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(15)),
                                                          child: Center(
                                                              child: Text(
                                                            result[
                                                                'servicestatus'],
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: result['servicestatus']
                                                                            .toString() ==
                                                                        'Pending'
                                                                    ? Colors.red
                                                                    : result['servicestatus'].toString() ==
                                                                            'Cancelled'
                                                                        ? Colors
                                                                            .red
                                                                        : result['servicestatus'].toString() ==
                                                                                'Accepted'
                                                                            ? Colors.green
                                                                            : result['servicestatus'].toString() == 'Completed'
                                                                                ? Colors.green
                                                                                : result['servicestatus'].toString() == 'Verified'
                                                                                    ? Colors.green[600]
                                                                                    : result['servicestatus'].toString() == 'Assigned'
                                                                                        ? Colors.green[600]
                                                                                        : result['servicestatus'].toString() == 'Started'
                                                                                            ? Colors.red[600]
                                                                                            : result['servicestatus'].toString() == 'Re-Assigned'
                                                                                                ? Colors.green[600]
                                                                                                : Colors.transparent,
                                                                letterSpacing: 1.1),
                                                          )),
                                                        ),
                                                        Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  '#' +
                                                                      result['service_id']
                                                                          .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .indigo,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                // disable the ability to update the booked service by the
                                                                // customer
                                                                result['servicestatus']
                                                                            .toString() ==
                                                                        'Completed'
                                                                    ? Container()
                                                                    : result['servicestatus'].toString() ==
                                                                            'Accepted'
                                                                        ? Container()
                                                                        : result['servicestatus'].toString() ==
                                                                                'Cancelled'
                                                                            ? Container()
                                                                            : result['servicestatus'].toString() == 'Verified'
                                                                                ? Container()
                                                                                : InkWell(
                                                                                    onTap: () async {
                                                                                      showModalBottomSheet(
                                                                                          context: context,
                                                                                          isScrollControlled: false,
                                                                                          builder: (context) => Scaffold(
                                                                                                body: SafeArea(
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 50,
                                                                                                          decoration: BoxDecoration(color: Colors.indigo),
                                                                                                          child: Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                                child: Text(
                                                                                                                  'Update Booked Service',
                                                                                                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                                child: InkWell(
                                                                                                                    onTap: () async {
                                                                                                                      // if (datetimepicker.isEmpty) {
                                                                                                                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                                      //   content: Text(
                                                                                                                      //     'Please Pick Date & Time',
                                                                                                                      //     style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                                                                                                                      //   ),
                                                                                                                      //   duration: const Duration(seconds: 1),
                                                                                                                      // ));
                                                                                                                      // }
                                                                                                                      // updatebookedservice
                                                                                                                      if (datetimepicker.isEmpty) {
                                                                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                                          content: Text(
                                                                                                                            'Please Pick Date & Time',
                                                                                                                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                                                                                                                          ),
                                                                                                                          duration: const Duration(seconds: 1),
                                                                                                                        ));
                                                                                                                      } else if (address.text == '') {
                                                                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                                          content: Text(
                                                                                                                            'Please Enter Address',
                                                                                                                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                                                                                                                          ),
                                                                                                                          duration: const Duration(seconds: 1),
                                                                                                                        ));
                                                                                                                      } else if (description.text == '') {
                                                                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                                          content: Text(
                                                                                                                            'Please Enter Description',
                                                                                                                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                                                                                                                          ),
                                                                                                                          duration: const Duration(seconds: 1),
                                                                                                                        ));
                                                                                                                      } else {
                                                                                                                        final output = await updatebookedservice.updateservicedata(collectionid: collectionid, date: datetimepicker[0], time: datetimepicker[1], address: address.text, description: description.text);

                                                                                                                        if (output == 'success') {
                                                                                                                          Navigator.pop(context);
                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                                            content: Text(
                                                                                                                              'Booked Service Updated',
                                                                                                                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                                                                                                                            ),
                                                                                                                            duration: const Duration(seconds: 1),
                                                                                                                          ));
                                                                                                                        } else {
                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                                            content: Text(
                                                                                                                              output.toString(),
                                                                                                                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                                                                                                                            ),
                                                                                                                            duration: const Duration(seconds: 1),
                                                                                                                          ));
                                                                                                                        }
                                                                                                                      }
                                                                                                                    },
                                                                                                                    child: Text(
                                                                                                                      'Done',
                                                                                                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                                                    )),
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          margin: const EdgeInsets.only(left: 12, top: 12),
                                                                                                          child: const Text(
                                                                                                            'Date And Time',
                                                                                                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsets.all(14.0),
                                                                                                          child: Container(
                                                                                                            padding: const EdgeInsets.only(top: 10, left: 16),
                                                                                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), boxShadow: [
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

                                                                                                                final String datepick = '${pickedDate?.year.toString()}' + '-${pickedDate?.month.toString()}' + '-${pickedDate?.day.toString()}';

                                                                                                                datetimepicker.add(datepick);
                                                                                                                // String formattedDate =
                                                                                                                //     DateFormat('yyyy-MM-dd').format(pickedDate);
                                                                                                                // print(pickedDate);
                                                                                                                TimeOfDay? newtime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: datetime.hour, minute: datetime.minute));
                                                                                                                datetimepicker.add(newtime?.format(context));

                                                                                                                // datetimepicker.add(newtime?.format(context));
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        // address
                                                                                                        Container(
                                                                                                          margin: const EdgeInsets.only(left: 4, top: 12),
                                                                                                          child: const Text(
                                                                                                            'Your Address',
                                                                                                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                                          child: Container(
                                                                                                            padding: const EdgeInsets.only(top: 10, left: 16),
                                                                                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), boxShadow: [
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
                                                                                                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsets.all(14.0),
                                                                                                          child: Container(
                                                                                                            padding: const EdgeInsets.only(left: 16),
                                                                                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), boxShadow: [
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
                                                                                                ),
                                                                                              ));
                                                                                    },
                                                                                    child: const Icon(
                                                                                      Icons.edit_note_sharp,
                                                                                      color: Colors.grey,
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(
                                                      result['service_name']
                                                          .toUpperCase(),
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          letterSpacing: 1.2,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(
                                                      '\$' +
                                                          result['price']
                                                              .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 19,
                                                          color: Colors.indigo,
                                                          letterSpacing: 1.2,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              width: 340,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[50],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Date & Time',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.indigo,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          result['date']
                                                                  .toString() +
                                                              ' At ' +
                                                              result['time']
                                                                  .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    const Center(
                                                      child: Divider(
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Provider-Email',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.indigo,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          result['provideremail']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Payment Method',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.indigo,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          result['payment_method']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Payment Status',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.indigo,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          result['payment_status']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 24,
                                                    ),
                                                    result['servicestatus']
                                                                .toString() ==
                                                            'Accepted'
                                                        ? Container()
                                                        : result['servicestatus']
                                                                    .toString() ==
                                                                'Pending'
                                                            ? Center(
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    // change the status of service when its cancelled
                                                                    String output = await updatebookedservice.changestatustocancel(
                                                                        collectionid:
                                                                            collectionid
                                                                                .toString(),
                                                                        datapassed:
                                                                            'Cancelled');
                                                                    if (output ==
                                                                        'success') {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Booked service is cancelled',
                                                                          style: const TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),
                                                                        duration:
                                                                            const Duration(seconds: 1),
                                                                      ));
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              SnackBar(
                                                                        content:
                                                                            Text(
                                                                          output,
                                                                          style: const TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),
                                                                        duration:
                                                                            const Duration(seconds: 1),
                                                                      ));
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                10),
                                                                    width: 200,
                                                                    height: 55,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.red[
                                                                            50],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      'Cancel Booking',
                                                                      style: TextStyle(
                                                                          color: Colors.red[
                                                                              600],
                                                                          fontSize:
                                                                              18),
                                                                    )),
                                                                  ),
                                                                ),
                                                              )
                                                            : result['servicestatus']
                                                                        .toString() ==
                                                                    'Cancelled'
                                                                ? Container()
                                                                : result['servicestatus']
                                                                            .toString() ==
                                                                        'Completed'
                                                                    ? Center(
                                                                        child:
                                                                            // get payment process when user confirm the completion
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            // service name
                                                                            // service id
                                                                            // service provider email
                                                                            // client_email
                                                                            // payment status

                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (context) => Paymentprocedureinservicecompletion(
                                                                                          serviceid: result['service_id'].toString(),
                                                                                          servicename: result['service_name'].toString(),
                                                                                          provideremail: result['provideremail'].toString(),
                                                                                          totalamount: result['price'].toString(),
                                                                                          collectionid: collectionid,
                                                                                        )));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 10),
                                                                            width:
                                                                                250,
                                                                            height:
                                                                                55,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
                                                                            child: Center(
                                                                                child: Text(
                                                                              'Confirm Service Completion',
                                                                              style: TextStyle(color: Colors.white, fontSize: 17),
                                                                            )),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : Container()
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ));
                            }),
                      ),
                    ]);
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
