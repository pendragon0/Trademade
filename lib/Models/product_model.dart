class Product {
  String name;
  int price;
  String description;
  String imageUrl;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.quantity = 1,
  });
}
