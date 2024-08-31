import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = "About as";

  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("About Us",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Comercy Program',

              ),
              SizedBox(height: 16),
              Text(
                'Comercy is a cutting-edge program designed to streamline and enhance commerce activities. Our mission is to empower businesses by providing efficient tools and solutions that simplify daily operations, improve customer experiences, and drive growth.',

              ),
              SizedBox(height: 16),
              Text(
                'Key Features:',

              ),
              SizedBox(height: 8),
              Text(
                '• Seamless integration with existing systems\n'
                    '• Intuitive user interface\n'
                    '• Advanced analytics and reporting\n'
                    '• Secure and scalable infrastructure\n',

              ),
              SizedBox(height: 16),
              Text(
                'At Comercy, we are committed to helping businesses thrive in the digital age. Join us on this journey to unlock new opportunities and achieve greater success.',

              ),
            ],
          ),
        ),
      ),
    );
  }
}