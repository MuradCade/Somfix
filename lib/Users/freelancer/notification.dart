import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'There Is No Notification Yet',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
      icon: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
        child: Icon(
          Icons.notifications_none,
          size: 24,
          color: Colors.black54,
        ),
      ),
    );
  }
}
