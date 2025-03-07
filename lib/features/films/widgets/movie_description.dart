import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    required this.text,
    this.fontSize = 11,
    this.height = 1.0,
    this.maxLines,
  });

  final String text;
  final double fontSize;
  final double height;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, height: height),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
