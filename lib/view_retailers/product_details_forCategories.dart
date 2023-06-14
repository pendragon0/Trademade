// ignore_for_file: unused_import, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/Const/colors.dart';

import 'package:trademade/controllers/categories_controller.dart';
import 'package:trademade/view_retailers/product_description_page.dart';

import 'bottom_app_bar.dart';

class ProductDetails extends StatelessWidget {
  final String category;
  final String subCategory;
  final String productInfo;

  ProductDetails({
    required this.category,
    required this.subCategory,
    required this.productInfo,
  });

  CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Product Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GetBuilder(
                init: controller,
                builder: (_) {
                  return controller.isLoading.value == false
                      ? GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.products.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            //show product button
                            return InkWell(
                                onTap: () {
                                  _handleImageTap(context, index);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            controller.products[index]
                                                .productImageUrl,
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Text(controller
                                                  .products[index].name),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Text(controller
                                                  .products[index].price
                                                  .toString())
                                            ],
                                          )),
                                    ],
                                  ),
                                ));
                          },
                        )
                      : Center(child: CircularProgressIndicator.adaptive());
                }),
          ),
          // Text(
          //   'Category: $category',
          //   style: TextStyle(fontSize: 24),
          // ),
          // SizedBox(height: 16),
          // Text(
          //   'Subcategory: $subCategory',
          //   style: TextStyle(fontSize: 24),
          // ),
          // SizedBox(height: 16),
          // Text(
          //   'Product Name: $productInfo',
          //   style: TextStyle(fontSize: 24),
          // ),
        ],
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 1),
    );
  }

  void _handleImageTap(BuildContext context, int index) {
    final product = controller.products[index];
    Get.offAll(ProductDescriptionPage(
      name: product.name,
      price: product.price,
      description: product.description,
      imageUrl: product.productImageUrl,
    ));
  }
}
