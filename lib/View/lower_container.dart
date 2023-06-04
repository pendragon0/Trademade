import 'package:flutter/material.dart';
import 'package:trademade/View/product_card.dart';

class LowerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(products.length, (index) {
            return ProductCard(
              imageUrl: products[index].imageUrl,
              onTap: () {
                // Handle product tap
              },
            );
          }),
        ),
      ),
    );
  }
}
