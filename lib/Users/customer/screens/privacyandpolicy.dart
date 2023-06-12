import 'package:flutter/material.dart';

class PrivacyandPolicy extends StatefulWidget {
  const PrivacyandPolicy({super.key});

  @override
  State<PrivacyandPolicy> createState() => _PrivacyandPolicyState();
}

class _PrivacyandPolicyState extends State<PrivacyandPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFF5f60ba),
        elevation: 0,
        // actions: [],
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                "We are responsible for maintaining and protecting the Personal Information under our control. \n \nWe have designated an individual or individuals who is/are responsible for compliance with our privacy policy.\n\nPersonal Information will be protected by security safeguards that are appropriate to the sensitivity level of the information. \n\nWe take all reasonable precautions to protect your Personal Information from any loss or unauthorised use, access or disclosure.We collect, use and disclose Personal Information to provide you with the product or service you have requested and to offer you additional products and services we believe you might be interested in. \n\nThe purposes for which we collect Personal Information will be identified before or at the time we collect the information.\n\nIn certain circumstances, the purposes for which information is collected may be clear, and consent may be implied, such as where your name, address and payment information is provided as part of the order process.\n\nYou may direct any questions or enquiries with respect to our privacy policy or our practices by contacting our email \n somfix@maintainancecompany.com",
                maxLines: 54,
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    height: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
