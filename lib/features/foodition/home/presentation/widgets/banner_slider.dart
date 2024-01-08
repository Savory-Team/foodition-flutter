import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<String> items;
  const BannerSlider({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final controller = CarouselController();

    return CarouselSlider(
      items: items
          .map((e) => Image.asset(
                e,
                height: 240.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ))
          .toList(),
      carouselController: controller,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 428 / 240,
        viewportFraction: 1,
        onPageChanged: (index, reason) {},
      ),
    );
  }
}
