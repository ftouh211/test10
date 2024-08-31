import 'package:flutter/material.dart';
import 'package:untitled2/dio/models/productis_model.dart';

class ProductDetiels extends StatelessWidget {
  static const String routeName = "detiels";
  final Product product;

  // Accept the product details in the constructor
  const ProductDetiels({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Price: \$${product.price}",
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
            const SizedBox(height: 16.0),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}