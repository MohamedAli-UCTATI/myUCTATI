import 'package:flutter/material.dart';

class ImageAss extends StatelessWidget {
  const ImageAss({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.fill,
    );
  }
}
