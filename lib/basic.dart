
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/about_us.dart';
import 'package:untitled2/dio/api_provider.dart';
import 'package:untitled2/dio/models/productis_model.dart';
import 'package:untitled2/product_detiels.dart';

class Basic extends StatefulWidget {
  static const String routeName = "Basic";
  Basic({super.key});

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        // centerTitle: true,
        // leading: ,
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.headphones_sharp),
          //   onPressed: () {
          //     Navigator.pushNamed(context, team.routeName);
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.ad_units),
              onPressed: () {
                Navigator.pushNamed(context, AboutUs.routeName);
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<Ecomercy?>(
        future: ApiProvider().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          Ecomercy ecomercyModel = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: ecomercyModel.products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to ProductDetiels page when the card is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetiels(
                        product: ecomercyModel.products[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.teal,
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.network(
                          ecomercyModel.products[index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ecomercyModel.products[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              "Price: \$${ecomercyModel.products[index].price}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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