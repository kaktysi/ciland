import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.text,
    this.letterSpacing,
    this.fontSize = 28,
    this.fontWeight = FontWeight.w500,
    this.color,
  });

  final String text;
  final double fontSize;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: color,
        ),
      ),
    );
  }
}
