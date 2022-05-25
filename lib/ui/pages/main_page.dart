import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slider_using_pageview/ui/widgets/movie_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double currentPageValue = 0;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 0.6);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/dramatic-movie-poster-template-design-5d75e35ef878f74977c88e3ff26b0c70_screen.jpg?ts=1636997015',
      'https://i.pinimg.com/originals/dd/17/f5/dd17f5ff6c75891cadb6d5f7e1460613.jpg',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Widget Slider'),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          double difference = index - currentPageValue; // 0.0, -1.0, 1.0
          if (difference < 0) {
            difference *= -1;
          }
          difference = min(1, difference);
          return Center(
            child: MovieBox(
              url: urls[index],
              scale: 1 - (difference * 0.3),
            ),
          );
        },
      ),
    );
  }
}
