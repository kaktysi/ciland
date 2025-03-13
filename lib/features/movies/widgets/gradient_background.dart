import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    this.borderRadius = 0,
    required this.begin,
    required this.end,
    required this.colorList,
  });

  final double borderRadius;
  final Alignment begin;
  final Alignment end;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(begin: begin, end: end, colors: colorList),
      ),
    );
  }
}
