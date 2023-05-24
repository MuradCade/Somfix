import 'package:flutter/material.dart';
import 'package:somfixapp/Users/freelancer/screens/update_service.dart';

import '../data/updateservice.dart';
import '../mainscreen.dart';
import 'dashboard.dart';

class Createdservicedetailscreen extends StatefulWidget {
  Createdservicedetailscreen({
    required this.id,
    required this.image,
    required this.category,
    required this.servicename,
    required this.price,
    required this.description,
    required this.duration,
    required this.serviceaddress,
    required this.servicestatus,
    required this.servicetype,
    required this.discount,
  });
  final String id;
  final String image;
  final String category;
  final String servicename;
  final String price;
  final String description;
  final String duration;
  final String serviceaddress;
  final String servicestatus;
  final String servicetype;
  final String discount;

  @override
  State<Createdservicedetailscreen> createState() =>
      _CreatedservicedetailscreenState();
}

class _CreatedservicedetailscreenState
    extends State<Createdservicedetailscreen> {
  Updateservicedata deleteservice = Updateservicedata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 380),
              // decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',
                      style: TextStyle(
                          fontSize: 19,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.description}',
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        letterSpacing: 1.4,
                        color: Colors.black87),
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text('Rating(0)',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'No Ratings Yet',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
            // image holder container
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage('${widget.image}'),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // go back icon button
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // more icon (edit or delete)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Alert Dialog"),
                              content: const Text(
                                "Please perform the action you need by clicking the button below",
                                maxLines: 2,
                                style: TextStyle(fontSize: 16, height: 1.4),
                              ),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Updateservice(
                                                      id: "${widget.id}",
                                                      img: '${widget.image}',
                                                      servicecategory:
                                                          '${widget.category}',
                                                      servicename:
                                                          '${widget.servicename}',
                                                      price: '${widget.price}',
                                                      duration:
                                                          '${widget.duration}',
                                                      description:
                                                          '${widget.description}',
                                                      discount:
                                                          '${widget.discount}',
                                                      serviceaddress:
                                                          '${widget.serviceaddress}',
                                                      servicestatus:
                                                          '${widget.servicestatus}',
                                                      servicetype:
                                                          '${widget.servicetype}',
                                                    )));
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.green[500],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        // padding: const EdgeInsets.all(14),
                                        child: Center(
                                          child: Text("Update",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // delete selected service
                                        final output = await deleteservice
                                            .deletesignleservice(
                                                id: '${widget.id}');

                                        if (output == "success") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              'Service Successfully Deleted',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            duration:
                                                const Duration(seconds: 1),
                                          ));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Freelancer()));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
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
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.red[500],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        // padding: const EdgeInsets.all(14),
                                        child: Center(
                                          child: Text("Delete",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                )
                              ],
                            ),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // floating card
            Positioned(
              top: 150,
              left: 16,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    width: 360,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                      )
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, left: 15.0),
                          child: Text('${widget.category}',
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1.5,
                                  color: Colors.grey.shade600)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 15.0),
                          child: Text('${widget.servicename}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 15.0),
                          child: Text('\$ ' + '${widget.price}',
                              style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1.5,
                                  color: Color(0xFFF5f60ba),
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Duration',
                                  style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: 1.5,
                                      color: Colors.grey[600])),
                              Container(
                                margin: EdgeInsets.only(right: 18),
                                child: Text('${widget.duration}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 1.5,
                                        color: Color(0xFFF5f60ba),
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rating',
                                  style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: 1.5,
                                      color: Colors.grey[600])),
                              Container(
                                  margin: EdgeInsets.only(right: 18),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_outline,
                                        color: Color(0xFFF5f60ba),
                                      ),
                                      Text('0',
                                          style: TextStyle(
                                              fontSize: 17,
                                              letterSpacing: 1.5,
                                              color: Color(0xFFF5f60ba),
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
