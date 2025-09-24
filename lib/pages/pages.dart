import 'package:flutter/material.dart';
import 'package:pinterest_ui/App%20Project/design1.dart';
import 'package:pinterest_ui/App%20Project/design2.dart';
import 'package:pinterest_ui/App%20Project/design3.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/Mobile%20Ui/design2.dart';
import 'package:pinterest_ui/Mobile%20Ui/design3.dart';
import 'package:pinterest_ui/music_Screen/design1.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Design1()),
                );
              },
              child: Text("Mobile ui Design1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Design2()),
                );
              },
              child: Text("Mobile ui Design2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Design3()),
                );
              },
              child: Text("Mobile ui Design3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppProjectDesign1()),
                );
              },
              child: Text("AppProject Design1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppProjectDesign2()),
                );
              },
              child: Text("AppProject Design2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppProjectDesign3()),
                );
              },
              child: Text("AppProject Design3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudiobookHomeScreen()),
                );
              },
              child: Text("Audiobook Home Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
