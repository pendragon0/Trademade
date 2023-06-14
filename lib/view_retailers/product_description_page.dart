import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/product_model.dart';
import '../controllers/cartstate_controller.dart';
import 'bottom_app_bar.dart';

class ProductDescriptionPage extends StatelessWidget {
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  // final String productId;
  // final String productQuantity;

  ProductDescriptionPage({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    // required this.productId,
    // required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return Scaffold(
      // bottomNavigationBar: const CustomBottomAppBar(currentIndex: 2),
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Product Description'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "$price pkr",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Create the product object with the provided data
              Product product = Product(
                name: name,
                price: price,
                imageUrl: imageUrl,
                quantity: 1,
                description: description,
              );

              // Add the product to the cart
              cartController.addToCart(product);

              // Show a success message or perform any other actions
              // after adding the product to the cart
              Get.snackbar(
                'Success',
                'Product added to cart!',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              elevation: 4.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 1),
    );
  }
}
