import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../data/updateservice.dart';

class Updateservice extends StatefulWidget {
  Updateservice(
      {super.key,
      required this.id,
      required this.img,
      required this.servicecategory,
      required this.servicename,
      required this.price,
      required this.duration,
      required this.description,
      required this.discount,
      required this.serviceaddress,
      required this.servicestatus,
      required this.servicetype});
  final String id;
  final String img;
  final String servicecategory;
  final String servicename;
  final String price;
  final String duration;
  final String description;
  final String discount;
  final String serviceaddress;
  final String servicestatus;
  final String servicetype;

  @override
  State<Updateservice> createState() => _AddServiceState();
}

class _AddServiceState extends State<Updateservice> {
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
  Updateservicedata updateservice = Updateservicedata();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicename.text = '${widget.servicename}';
    serviceaddress.text = '${widget.serviceaddress}';
    price.text = '${widget.price}';
    discount.text = '${widget.discount}';
    description.text = '${widget.description}';
    if ('${widget.servicecategory}' == 'Plumber') {
      servicetype = '1';
    } else if ('${widget.servicecategory}' == 'Electrician') {
      servicetype = '2';
    } else if ('${widget.servicecategory}' == 'Handyman') {
      servicetype = '3';
    } else if ('${widget.servicecategory}' == 'Cleaner') {
      servicetype = '4';
    } else if ('${widget.servicecategory}' == 'Painter') {
      servicetype = '5';
    }

    if ('${widget.servicetype}' == 'Free') {
      type = '1';
    } else if ('${widget.servicetype}' == 'Fixed') {
      type = '2';
    } else if ('${widget.servicetype}' == 'Hourly') {
      type = '3';
    }

    if ('${widget.servicestatus}' == 'Active') {
      servicestatus = '1';
    }
    if ('${widget.servicestatus}' == 'Inactive') {
      servicestatus = '2';
    }

    image.add('${widget.img}');
    datetimepicker.add('${widget.duration}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Service'),
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
                      items: const [
                        DropdownMenuItem(
                          value: '-1',
                          child: Text('Type'),
                        ),
                        DropdownMenuItem(
                          value: "1",
                          child: Text('Free'),
                        ),
                        DropdownMenuItem(
                          value: "2",
                          child: Text('Fixed'),
                        ),
                        DropdownMenuItem(
                          value: "3",
                          child: Text('Hourly'),
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
                      items: const [
                        DropdownMenuItem(
                          value: '-1',
                          child: Text('Status'),
                        ),
                        DropdownMenuItem(
                          value: "1",
                          child: Text('Active'),
                        ),
                        DropdownMenuItem(
                          value: "2",
                          child: Text('Inactive'),
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
                      // print('Please Choose Image');
                    } else if (datetimepicker.isEmpty) {
                      print('Please Choose Duration');
                    } else {
                      // print('good move on');
                      final output = await updateservice.updatesignleservice(
                          id: '${widget.id}',
                          serviceimage: image[0].toString(),
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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Service Updated Successfully',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          duration: const Duration(seconds: 1),
                        ));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Service Updated Successfully',
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
                        'Update',
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
