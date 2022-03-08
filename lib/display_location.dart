import 'package:flutter/material.dart';

class DisplayLocation extends StatelessWidget {
  DisplayLocation({this.text, this.location});
  final text;
  final location;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${text}:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${location}",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ));
  }
}
