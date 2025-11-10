import 'package:flutter/material.dart';

enum Product {
  Dart(
    description: "the best object language",
    title: 'Dart',
    image: 'assets/W5-assets/ex3/dart.png',
  ),
  Flutter(
    description: "the best mobile widget library",
    title: 'Flutter',
    image: 'assets/W5-assets/ex3/flutter.png',
  ),
  Firebase(
    description: "the best cloud database",
    title: "Firebase",
    image: 'assets/W5-assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 15,
          children: [
            ProductCard(product: Product.Dart),
            ProductCard(product: Product.Flutter),
            ProductCard(product: Product.Firebase),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Image.asset(product.image, scale: 3),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(product.title, style: TextStyle(fontSize: 30)),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(product.description, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
