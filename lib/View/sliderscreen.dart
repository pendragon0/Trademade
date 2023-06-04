import 'package:flutter/material.dart';
import './getstarted.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLastPage = false;

  final List<String> _images = [
    'assets/images/slider_img1.jpg',
    'assets/images/slider_img2.jpg',
    'assets/images/slider_img3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
        _isLastPage = _currentPage == _images.length - 1;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToGetStarted() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetStarted()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            right: 24,
            child: IconButton(
              onPressed: _isLastPage ? _navigateToGetStarted : () {},
              icon: Icon(
                _isLastPage ? Icons.arrow_forward : Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 14, 13, 13),
                size: 32,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: TextButton(
              onPressed: _navigateToGetStarted,
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 10, 10),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}