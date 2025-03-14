import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.imageUrl});

  final String imageUrl;

  bool get _isValidUrl => imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(21),
      child: _isValidUrl
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) => _placeholderImage(),
            )
          : _placeholderImage(),
    );
  }

  Widget _placeholderImage() {
    return SvgPicture.asset(
      'assets/svg/no_picture.svg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
