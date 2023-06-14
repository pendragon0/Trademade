import 'package:get/get.dart';

import '../Models/product_model.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;

  void addToCart(Product product) {
    if (cartItems.contains(product)) {
      final index = cartItems.indexOf(product);
      final existingProduct = cartItems[index];
      existingProduct.quantity++;
      cartItems[index] = existingProduct;
    } else {
      product.quantity = 1;
      cartItems.add(product);
    }
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  void increaseQuantity(Product product) {
    final index = cartItems.indexOf(product);
    final existingProduct = cartItems[index];
    existingProduct.quantity++;
    cartItems[index] = existingProduct;
  }

  void decreaseQuantity(Product product) {
    final index = cartItems.indexOf(product);
    final existingProduct = cartItems[index];
    if (existingProduct.quantity > 1) {
      existingProduct.quantity--;
      cartItems[index] = existingProduct;
    }
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (final product in cartItems) {
      totalPrice += (product.price * product.quantity);
    }
    return totalPrice;
  }

  void checkout() {
    // Implement your checkout logic here
    // For example, you can navigate to a checkout screen
  }
}
