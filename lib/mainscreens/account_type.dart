import 'package:flutter/material.dart';
import 'package:somfixapp/mainscreens/signup.dart';

import 'create_company_account.dart';
import 'freelancer_account.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    'assets/iland.png',
                    height: 280,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select type of your account',
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Information'),
                            content: const Text(
                              'Looks like you have access to multiple account type. Choose from the options below to get started using our app',
                              maxLines: 5,
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  letterSpacing: 1.5),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'))
                            ],
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.lightBlue[700],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                // card for user account type -card 1
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: Card(
                      elevation: 6,
                      margin: const EdgeInsets.only(top: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(
                              'assets/user.png',
                              height: 45,
                            ),
                            title: const Text('Personal use'),
                            subtitle: const Text('Create Personal Account'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // card 2
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4.0, bottom: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Freelancercreateaccount()));
                    },
                    child: Card(
                      elevation: 6,
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(
                              'assets/freelance.png',
                              height: 45,
                            ),
                            title: const Text('A Freelancer'),
                            subtitle:
                                const Text('Im a freelancer, looking for work'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // card 3
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4.0, bottom: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Companymainscreen()));
                    },
                    child: Card(
                      elevation: 6,
                      margin: const EdgeInsets.only(top: 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(
                              'assets/company.png',
                              height: 45,
                            ),
                            title: const Text('Company use'),
                            subtitle: const Text('Create Company Account'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
