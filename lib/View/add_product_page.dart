import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trademade/View/homepage.dart';
import 'package:trademade/controllers/profile_controller.dart';

import 'bottom_app_bar.dart';
import 'cart.dart';
import 'how_it_works.dart';
import 'who_are_we.dart';

class AddProductPage extends StatefulWidget {
  final Category category;
  final String subCategory;

  AddProductPage({required this.category, required this.subCategory});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late ProfileController profileController = Get.put(ProfileController());
  // late String category = category.name;
  // late String subCategory = widget.subCategory;

  String productName = '';
  String productPrice = '';
  String productDescription = '';
  List<String> productImages = [];
  File? testimages;

  //testing variable for imageURL in string
  var imageLink;

  //Variable to store the download URL
  String imageDownloadUrl = '';

  _openGallery() async {
    // final picker = ImagePicker();
    print('************Open Gallery started');
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    print("${pickedImage?.path}");
    if (pickedImage == null) return;

    //For a unique filename for each image
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //Getting a reference to the storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    //Creating a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    //Handle errors/success
    try {
      //store the file
      await referenceImageToUpload.putFile(File(pickedImage.path));
      //Success: get the download URL
      imageDownloadUrl = await referenceImageToUpload.getDownloadURL();
      imageLink = imageDownloadUrl;
    } catch (e) {}

    if (pickedImage != null) {
      setState(() {
        print('************setting state');
        productImages.add(pickedImage.path);
        testimages = File(pickedImage.path);

        // print("$testimages");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton(onPressed: _openGallery, child: Text ("Open Cam")),
              GestureDetector(
                onTap: _openGallery,
                child: Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      height: 16.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_a_photo,
                            size: 19.0,
                          ),
                          // const SizedBox(height: 1.0),
                          const Text(
                            'Add an image',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Expanded(
                            child: testimages != null
                                ? Image.file(
                                    testimages!,
                                    height: 100.0,
                                    width: 100.0,
                                    fit: BoxFit.fill,
                                  )
                                : const Placeholder(
                                    fallbackHeight: 100.0,
                                    fallbackWidth: 100.0,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Category',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                    ),
                    child: Icon(
                      widget.category.icon,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.category.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(widget.subCategory),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              //Product Name field
              TextField(
                controller: profileController.nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    productName = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              //Product Price field
              TextField(
                controller: profileController.priceController,
                decoration: const InputDecoration(
                  labelText: 'Product Price',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    productPrice = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              //Add Product Description field
              TextField(
                controller: profileController.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    productDescription = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    // print('${widget.category.name}');
                    // print('${widget.subCategory}');
                    profileController.selectCategory(widget.category.name);
                    profileController.selectsubCategory(widget.subCategory);
                    profileController.updateImagePath(imageLink);
                    profileController.addProduct();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Add Product',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 4),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final List<Category> categories = [
    Category(name: 'Fashion', icon: Icons.accessibility),
    Category(name: 'Electronics', icon: Icons.phone_android),
  ];

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3C8589),
              ),
              child: Text(
                ' ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('HOME'),
              onTap: () {
                // Handle HOME button tap
              },
            ),
            ListTile(
              title: const Text('CATEGORIES'),
              onTap: () {
                // Handle CATEGORIES button tap
              },
            ),
            ListTile(
              title: const Text('CART'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cart()),
                );
              },
            ),
            ListTile(
              title: const Text('PROFILE'),
              onTap: () {
                // Handle PROFILE button tap
              },
            ),
            ListTile(
              title: const Text('WHO ARE WE'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhoWeArePage()),
                );
              },
            ),
            ListTile(
              title: const Text('HOW IT WORKS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HowItWorks()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle Logout button tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 4),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(HomePage() as BuildContext);
          },
        ),
        title: const Text('What are you selling?'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryTile(category: category);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class CategoryTile extends StatelessWidget {
  final Category category;
  // ProfileController profileController = Get.put(ProfileController());
  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(category.icon),
      title: Text(category.name),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        // profileController.selectCategory(category.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryPage(category: category),
          ),
        );
      },
    );
  }
}

class SubCategoryPage extends StatelessWidget {
  final Category category;

  // ProfileController profileController = Get.find<ProfileController>();
  SubCategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<String> subCategories = category.name == 'Fashion'
        ? ['Shirt', 'Pant']
        : category.name == 'Electronics'
            ? ['Phone', 'Headphones']
            : [];

    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 4),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Choose Subcategory'),
      ),
      body: ListView.builder(
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          final subCategory = subCategories[index];
          return ListTile(
            title: Text(subCategory),
            onTap: () {
              String selectedSubCategory = '';
              print('${subCategory}');
              if (subCategory == 'Phone') {
                selectedSubCategory = 'Phone';
              } else if (subCategory == 'Headphones') {
                selectedSubCategory = 'Headphones';
              }
              // profileController.selectsubCategory(selectedSubCategory);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProductPage(
                    category: category,
                    subCategory: subCategory,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
