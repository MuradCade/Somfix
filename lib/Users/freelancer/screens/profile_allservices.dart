import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/create_service.dart';

class Createservice extends StatefulWidget {
  const Createservice({super.key});

  @override
  State<Createservice> createState() => _CreateserviceState();
}

class _CreateserviceState extends State<Createservice> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Service'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddService()));
              },
              child: const Icon(
                Icons.add,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
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
                  child: TextFormField(
                    // controller: widget.controller,
                    // keyboardType: widget.Textinputtype,
                    // obscureText: widget.Obsecure,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      // prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(height: 1),
                    ),
                  ),
                ),

                // display services created by the user
                const SizedBox(
                  height: 18,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('service')
                      .where('person_created_service', isEqualTo: user?.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue[300],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final result = snapshot.data!.docs[index];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(
                                          result['Service_image'],
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          result['Service_Name'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          "Price",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// create service

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  List image = [];
  String servicetype = '-1';
  String type = '-1';
  String servicestatus = '-1';

  DateTime datetime = DateTime(2022, 02, 25, 12, 30);
  List datetimepicker = [];

  TextEditingController servicename = TextEditingController();
  TextEditingController serviceaddress = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController description = TextEditingController();
  Addservice addnewservice = Addservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Service'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF5f60ba),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 7,
                    )
                  ]),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 14,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            // on this button clicks run this code below
                            FilePickerResult? results =
                                await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg'],
                            );
                            if (results == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('No Image Was Selected....'),
                                ),
                              );
                              return null;
                            }

                            final path = results.files.single.path;
                            final filename = results.files.single.name;
                            // print('path' + path.toString());
                            // print('filename' + filename.toString());
                            image.add(path);
                            image.add(filename);
                          },
                          child: const Text('Browse...')),
                      const SizedBox(width: 15),
                      const Text(
                        'Choose Service Image',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.8),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 55,
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
                  child: TextFormField(
                    controller: servicename,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Service Name',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.only(top: 3, left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButtonFormField(
                      value: servicetype,
                      items: [
                        const DropdownMenuItem(
                          child: Text('Service Category'),
                          value: '-1',
                        ),
                        const DropdownMenuItem(
                          child: Text('Plumber'),
                          value: "1",
                        ),
                        const DropdownMenuItem(
                          child: Text('Electrician'),
                          value: "2",
                        ),
                        const DropdownMenuItem(
                          child: Text('Handyman'),
                          value: "3",
                        ),
                        const DropdownMenuItem(
                          child: Text('Cleaner'),
                          value: "4",
                        ),
                        const DropdownMenuItem(
                          child: Text('Painter'),
                          value: "5",
                        ),
                      ],
                      onChanged: (value) {
                        servicetype = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 55,
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
                  child: TextFormField(
                    controller: serviceaddress,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Service Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.only(top: 3, left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButtonFormField(
                      value: type,
                      items: [
                        const DropdownMenuItem(
                          child: Text('Type'),
                          value: '-1',
                        ),
                        const DropdownMenuItem(
                          child: Text('Free'),
                          value: "1",
                        ),
                        const DropdownMenuItem(
                          child: Text('Fixed'),
                          value: "2",
                        ),
                        const DropdownMenuItem(
                          child: Text('Hourly'),
                          value: "3",
                        ),
                      ],
                      onChanged: (value) {
                        type = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.only(top: 3, left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButtonFormField(
                      value: servicestatus,
                      items: [
                        const DropdownMenuItem(
                          child: Text('Status'),
                          value: '-1',
                        ),
                        const DropdownMenuItem(
                          child: Text('Active'),
                          value: "1",
                        ),
                        const DropdownMenuItem(
                          child: Text('Inactive'),
                          value: "2",
                        ),
                      ],
                      onChanged: (value) {
                        servicestatus = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 55,
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
                  child: TextFormField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 55,
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
                  child: TextFormField(
                    controller: discount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Discount',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
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
                      labelText: 'Duration',
                    ),
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? newtime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: datetime.hour, minute: datetime.minute));
                      datetimepicker.add(newtime?.format(context));
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 55,
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
                  child: TextFormField(
                    maxLines: 550,
                    controller: description,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Description',
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () async {
                    if (image.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Please Choose Service Image',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        duration: Duration(seconds: 1),
                      ));
                    } else if (datetimepicker.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Please Choose Duration',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        duration: Duration(seconds: 1),
                      ));
                    } else {
                      var imgpath = image[0];
                      var imgname = image[1];

                      final imageurl = await addnewservice.uploadserviceimg(
                          imgpath, imgname);
                      String output = await addnewservice.addservicecollection(
                          serviceimage: imageurl.toString(),
                          servicename: servicename.text,
                          servicecategory: servicetype,
                          serviceaddress: serviceaddress.text,
                          type: type,
                          status: servicestatus,
                          price: price.text,
                          discount: discount.text,
                          durationandhour: datetimepicker[0].toString(),
                          description: description.text);
                      if (output == 'success') {
                        Navigator.pop(context);
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
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
