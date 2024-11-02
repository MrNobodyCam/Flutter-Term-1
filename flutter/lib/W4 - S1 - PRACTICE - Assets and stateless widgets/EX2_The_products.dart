import 'package:flutter/material.dart';

enum Product {
  Dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'dart.png',
  ),
  Flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    image: 'flutter.png',
  ),
  Firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    image: 'firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product(
      {required this.title, required this.description, required this.image});
}

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 300),
            Image.asset(
              'assets/${product.image}',
              width: 100,
            ),
            Text("${product.title}", style: TextStyle(fontSize: 30)),
            Text(
              "${product.description}",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ProductCard(product: Product.Dart),
            ProductCard(product: Product.Firebase),
            ProductCard(product: Product.Flutter),
          ],
        ),
      ),
    ),
  ));
}
