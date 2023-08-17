import 'package:carousel_slider/carousel_slider.dart';
import 'package:UCTATI/widget/image_asset_widget.dart';
import 'package:UCTATI/data/carousel.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CarouselSlider(
            items:
                images.map((image) => ImageAssetWidget(image: image)).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                initialPage: 0, // Set the initial page index
                enableInfiniteScroll: true, // Allow infinite scrolling
                autoPlay: true, // Enable auto-playing of slides
                autoPlayInterval:
                    const Duration(seconds: 3), // Set auto-play interval
                autoPlayAnimationDuration: const Duration(
                    milliseconds: 1500), // Set animation duration
                autoPlayCurve: Curves.fastOutSlowIn, // Set animation curve
                enlargeCenterPage: true, // Enlarge the center item
                onPageChanged: (index, reason) {
                  // Handle page change event
                }),
          )),
    );
  }
}
