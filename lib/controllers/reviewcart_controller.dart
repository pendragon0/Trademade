// import 'package:get/get.dart';
// import '../Models/product_model.dart';



// class ReviewCartController extends GetxController {
//   RxList<Product> cartItems = <Product>[].obs;

//   void addToCart({required String name, required int price, required int quantity}) {
//     // Check if the product is already in the cart
//     int existingIndex = cartItems.indexWhere((product) => product.name == name);

//     if (existingIndex != -1) {
//       // Product already exists in the cart, update the quantity
//       cartItems[existingIndex].quantity += quantity;
//     } else {
//       // Product doesn't exist in the cart, add it
//       cartItems.add(Product(name: name, price: price, quantity: quantity));
//     }
//   }

//   void increaseQuantity(int index) {
//     if (index >= 0 && index < cartItems.length) {
//       cartItems[index].quantity++;
//     }
//   }

//   void decreaseQuantity(int index) {
//     if (index >= 0 && index < cartItems.length) {
//       if (cartItems[index].quantity > 1) {
//         cartItems[index].quantity--;
//       } else {
//         removeItem(index);
//       }
//     }
//   }

//   void removeItem(int index) {
//     if (index >= 0 && index < cartItems.length) {
//       cartItems.removeAt(index);
//     }
//   }

//   int getTotalPrice() {
//     int totalPrice = 0;
//     for (var product in cartItems) {
//       totalPrice += (product.price * product.quantity);
//     }
//     return totalPrice;
//   }
// }
