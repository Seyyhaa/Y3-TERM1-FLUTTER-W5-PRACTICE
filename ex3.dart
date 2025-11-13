import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object languuage',
    imagePath: '../../../../assets/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    imagePath: '../../../../assets/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    imagePath: '../../../../assets/firebase.png',
  );

  final String title;
  final String description;
  final String imagePath;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
         appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Colors.white,
      ),
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ 
              const SizedBox(height: 16),
              ProductCard(product: Product.dart),
              const SizedBox(height: 12),
              ProductCard(product: Product.flutter),
              const SizedBox(height: 12),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}


class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    
    return Card(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              product.imagePath, 
              width: 100,
              height: 100,
            ),
          ),
          
        
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              product.title, 
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0), 
            child: Text(
              product.description, 
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}