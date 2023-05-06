import 'package:flutter/material.dart';

class Messageinbox extends StatefulWidget {
  const Messageinbox({super.key});

  @override
  State<Messageinbox> createState() => _MessageinboxState();
}

class _MessageinboxState extends State<Messageinbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'There Is No Messages Yet',
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
            Icons.message_outlined,
            size: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
