import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(21),
      child:
          imageUrl.isNotEmpty
              ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
              : SvgPicture.asset(
                'assets/svg/no_picture.svg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
    );
  }
}
