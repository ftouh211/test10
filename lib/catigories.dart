import 'package:flutter/material.dart';
import 'package:untitled2/dio/api_provider.dart';

import 'detiles_catigores.dart';

class CatigoriesPage extends StatefulWidget {
  static const String routeName = "CatigoriesPage";

  @override
  _CatigoriesPageState createState() => _CatigoriesPageState();
}

class _CatigoriesPageState extends State<CatigoriesPage> {
  List<dynamic>? categories;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final apiProvider = ApiProvider();
    final fetchedCategories = await apiProvider.getCategories();
    setState(() {
      categories = fetchedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: categories == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: categories!.length,
        itemBuilder: (context, index) {
          final category = categories![index];
          return ListTile(
            title: Text(category),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetilesCatigores(
                    category: category,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}