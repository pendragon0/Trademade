import 'package:cloud_firestore/cloud_firestore.dart';
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
        backgroundColor: Colors.teal,
        title: Text('Product Details'),
      ),
      body: Column(
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
          StreamBuilder<QuerySnapshot>(
              
              stream: FirebaseFirestore.instance
                  .collection("mainCategories")
                  .doc(category)
                  .collection(subCategory)
                  .snapshots(),
              builder: (context, snapshot) {
                
                List<Row> productWidgets = [];
                if (snapshot.hasData) {
                  final products = snapshot.data?.docs.reversed.toList();
                  for (var product in products!) {
                    final productWidget = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product['name'], style: const TextStyle(color: Colors.black),),
                        Text(product['price']),
                        Text(product['Description']),
                        Image.network(product['imageUrl'])
                      ],
                    );
                    productWidgets.add(productWidget);
                  }
                }
                return Expanded(
                  child: ListView(children: productWidgets, ),
                  
                );
              })
        ],
      ),
    );
  }
}
