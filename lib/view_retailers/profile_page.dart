import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trademade/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
 ProfilePage({super.key});

ProfileController profileController = Get.put(ProfileController());
  // File? productImage;
  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedImage != null) {
  //       productImage = File(pickedImage.path);
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: profileController.nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
              onChanged: (value) {
                
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Brand Name'),
              onChanged: (value) {
                
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: profileController.priceController,
              decoration: InputDecoration(labelText: 'Selling Price'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){

              },
              child: Text('Select Product Image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
                profileController.addProduct();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
