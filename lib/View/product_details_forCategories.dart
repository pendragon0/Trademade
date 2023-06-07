import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String category;
  final String subCategory;
  final String productInfo; 
   

  ProductDetails({
    required this.category,
    required this.subCategory,
    required this.productInfo,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Subcategory: $subCategory',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Product Name: $productInfo',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
