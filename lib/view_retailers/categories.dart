// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trademade/controllers/categories_controller.dart';
import 'package:trademade/view_retailers/product_details_forCategories.dart';

import 'bottom_app_bar.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayCategories(),
    );
  }
}

class DisplayCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/images/app_logo.jpeg',
                    width: 120.0,
                    height: 90.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CategoryTile(
                    image: 'assets/images/electronics_image.jpeg',
                    categoryName: 'Electronics',
                    subCategories: ['Phone', 'Headphones'],
                    subCategoryImages: [
                      'assets/images/phone_image.jpeg',
                      'assets/images/headphones_image.jpeg'
                    ],
                  ),
                  CategoryTile(
                    image: 'assets/images/fashion_image.jpeg',
                    categoryName: 'Fashion',
                    subCategories: ['Shirt', 'Pant'],
                    subCategoryImages: [
                      'assets/images/shirt_image.jpeg',
                      'assets/images/pant_image.jpg'
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 1),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  final List<String> subCategoryImages;

  // variables to be sent to categories Controller
  final String categoryName;
  final List<String> subCategories;

  CategoryTile(
      {required this.image,
      required this.categoryName,
      required this.subCategories,
      required this.subCategoryImages});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        print('Category Pressed: $categoryName');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryPage(
              category: categoryName,
              subCategories: subCategories,
              subCategoryImages: subCategoryImages,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth * 1,
        height: screenHeight * 0.25,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              categoryName,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoryPage extends StatelessWidget {
  final String category;
  final List<String> subCategories;
  final List<String> subCategoryImages;

  SubCategoryPage(
      {required this.category,
      required this.subCategories,
      required this.subCategoryImages});
  late CategoriesController categoryController =
      Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 1),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(category),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(subCategories.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ProductDetails(
                          category: category,
                          subCategory: subCategories[index],
                          productInfo:
                              categoryController.products.toString()))));
              print('Category Pressed: $category');
              print('Subcategory Pressed: ${subCategories[index]}');
              categoryController.selectCaregories(category);
              categoryController.selectsubCaregories(subCategories[index]);
              categoryController.fetchProducts();
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(subCategoryImages[index]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    subCategories[index],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
