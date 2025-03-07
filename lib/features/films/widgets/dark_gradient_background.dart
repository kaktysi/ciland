import 'package:flutter/material.dart';

class DarkGradientBackground extends StatelessWidget {
  const DarkGradientBackground({
    super.key,
    this.borderRadius = 0,
    required this.begin,
    required this.end,
  });

  final double borderRadius;
  final Alignment begin;
  final Alignment end;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
        ),
      ),
    );
  }
}
