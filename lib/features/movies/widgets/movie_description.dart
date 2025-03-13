import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    required this.text,
    this.fontSize = 11,
    this.height = 1.0,
    this.maxLines,
    this.color,
  });

  final String text;
  final double fontSize;
  final double height;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, height: height, color: color),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
