
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:untitled2/log_in_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "intro";
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: "First page",
        body: "Description",
        image: Image.asset("assets/images/onema.jpg"),
        decoration: PageDecoration(
            pageColor: Colors.tealAccent,

            titleTextStyle:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: const Text(
              "lets go",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))),
    PageViewModel(
        title: "Second page",
        body: " Description",
        image: Image.asset("assets/images/twom.png"),
        decoration: PageDecoration(
            pageColor: Colors.tealAccent,
            titleTextStyle:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: const Text(
              "lets go",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))),
    PageViewModel(
        title: "third page",
        body: "Description",
        image: Image.asset("assets/images/threem.jpg"),
        decoration: PageDecoration(
            pageColor: Colors.tealAccent,

            titleTextStyle:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: const Text(
              "lets go",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: Text(
        //   "hellow",
        //   style: TextStyle(fontSize: 25),
        // ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: Size(15, 15),
            color: Colors.black,
            activeSize: Size.square(20),
            activeColor: Colors.yellow,

          ),
          showDoneButton: true,
          done: Text(
            "Done",
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: Icon(
            Icons.arrow_forward,
            size: 20,
          ),
          onDone: () => onDone(context),
        ),
      ),
    );
  }
}

void onDone(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}