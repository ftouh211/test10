import 'package:flutter/material.dart';

class team extends StatelessWidget {
  static const String routeName = "team";
  const team({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: const Text(
          "Developer",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/manar1.jpg',),
              ),
            ),
            SizedBox(
              height: 15,

            ),
            Text(
              "Manar Yehia",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Mobile Application Developer With (Flutter)",
              style: TextStyle(fontSize: 10, ),
            ),

          ],
        ),
      ),
    );
  }
}