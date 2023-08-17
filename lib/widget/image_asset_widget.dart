import 'package:flutter/material.dart';

class ImageAssetWidget extends StatelessWidget {
  const ImageAssetWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.fill,
    );
  }
}
