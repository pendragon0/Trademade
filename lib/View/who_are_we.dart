import 'package:flutter/material.dart';

class WhoWeArePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who We Are?'),
        backgroundColor: const Color(0xFF3C8589),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome to TradeMade',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Our Vision',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'At TradeMade, we strive to revolutionize the way retailers source products. Our mission is to provide a platform that simplifies the entire process, making it easier than ever to discover, purchase, and deliver products to your customers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Simplifying Product Sourcing',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'We have built a comprehensive marketplace where wholesalers, carefully vetted by our team, showcase their wide range of products. By using our app, retailers can conveniently browse through a diverse selection of high-quality products from the comfort of their own homes.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Competitive Pricing and Genuine Reviews',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'We believe in fair and transparent pricing. Wholesalers on our platform are encouraged to offer competitive rates, ensuring that retailers can maximize their profit margins. To ensure your peace of mind, we provide genuine reviews and ratings from fellow retailers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Streamlined Delivery Process',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'With TradeMade, you can say goodbye to the hassles of managing product delivery. We take care of the logistics, ensuring that the products you purchase are promptly and safely delivered to your customers\' doorsteps. Our reliable delivery network ensures a seamless and efficient experience for you and your customers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Retailer Benefits and Wholesaler Success',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8589),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'We value our loyal retailers and successful wholesalers. Retailers who frequently purchase through our platform are eligible for exciting benefits, such as cashback offers. Additionally, wholesalers who consistently excel in sales can enjoy the advantage of increased visibility and customer preference.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WhoWeArePage(),
  ));
}
