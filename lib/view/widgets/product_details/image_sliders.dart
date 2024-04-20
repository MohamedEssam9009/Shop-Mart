import 'package:asroo_shop/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({super.key, required this.imageUrl});

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 500.0,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30.0,
          left: 180.0,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10.0,
              dotWidth: 10.0,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              dotColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
