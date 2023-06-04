import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const ProductCard({
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Product Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imageUrl;

  Product({
    required this.imageUrl,
  });
}

List<Product> products = [
  Product(
    imageUrl:
        'https://www.mrporter.com/variants/images/1647597306907732/in/w2000_q60.jpg',
  ),
  Product(
    imageUrl:
        'https://pakistanwatches.com/wp-content/uploads/2021/01/428609_D3VN0_2156_002_100_0000_Light-Leather-loafer-with-GG-Web-450x450.jpg',
  ),
  Product(
    imageUrl:
        'https://images.vestiairecollective.com/cdn-cgi/image/q=80,f=auto,/produit/black-leather-chanel-belt-31646200-1_5.jpg',
  ),
  Product(
    imageUrl:
        'https://www.chanel.com/images/t_fashionzoom1/f_auto/square-sunglasses-black-acetate-acetate-packshot-default-a71469x01081s0114-8853177073694.jpg',
  ),
];
