
import 'package:flutter/material.dart';
import 'package:untitled2/basic.dart';
import 'package:untitled2/catigories.dart';
import 'package:untitled2/team.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          backgroundColor:Colors.white54,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.headphones_sharp), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: ""),
          ]),
      body: tabs[selectedIndex],


    );
  }
}

List<Widget> tabs = [
  Basic(),
  team(),
  CatigoriesPage()
];