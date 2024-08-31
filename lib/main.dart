
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Home_screen.dart';
import 'package:untitled2/about_us.dart';
import 'package:untitled2/basic.dart';
import 'package:untitled2/catigories.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/itroduction_screen.dart';
import 'package:untitled2/log_in_screen.dart';
import 'package:untitled2/sign_up.dart';
import 'package:untitled2/team.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "start",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute:IntroScreen.routeName ,
      routes: {
        IntroScreen.routeName:(context) => IntroScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        SignUp.routeName:(context) => SignUp(),
        HomeScreen.routeName:(context) => HomeScreen(),
        Basic.routeName:(context) => Basic(),
        team.routeName:(context) => team(),
        CatigoriesPage.routeName:(context) => CatigoriesPage(),
        AboutUs.routeName:(context) => AboutUs(),
        // DetilesCatigores.routeName:(context) => DetilesCatigores(),

      },


    );
  }
}