import 'package:flutter/material.dart';


class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade Made',
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF3C8589)),
      ),
      home: HowItWorksPage(),
    );
  }
}

class HowItWorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How It Works'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const  [
              Text(
                'Register as a Wholesaler or Retailer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Wholesalers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              Text(
                'As a wholesaler, you can register on our platform and start uploading your products. Provide detailed information, including images, descriptions, and pricing, to attract retailers. Your products will be categorized for easy browsing.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Retailers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              Text(
                'Retailers can register and browse through a wide range of products uploaded by wholesalers. Products are categorized to simplify the search process. Retailers can view ratings and reviews to make informed decisions.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Product Selection and Availability Confirmation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              Text(
                'Retailers can search and select products based on categories and other filters. Once a retailer requests a specific product, we check with the wholesaler to confirm its availability. If the product is available, we inform the retailer and proceed with the next steps.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Customer Order and Delivery Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              Text(
                'Once the product availability is confirmed, the retailer provides us with the customer\'s details, including the delivery address. We arrange for the product to be delivered directly to the retailer\'s customer.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Payment Processing and Commission',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              Text(
                'We collect the cash payment from the customer upon delivery. After a week, we disburse the payments to retailers and wholesalers via bank transfer or the preferred method they have chosen. We retain a 5% commission as our service fee.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Advantages and Benefits',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              Text(
                'Retailers: Enjoy competitive pricing, a wide variety of products, and the convenience of sourcing from reputable wholesalers. Regular purchases may also qualify for cashback rewards.\n\nWholesalers: Gain exposure to a wider customer base, receive ratings and reviews, and have the opportunity to increase sales by offering competitive prices.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
