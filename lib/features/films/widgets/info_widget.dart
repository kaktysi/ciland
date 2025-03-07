import 'package:ciland/theme/theme.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.text,
    this.horizontalPadding = 10,
    this.verticalPadding = 3,
    this.marginRight = 5,
    this.borderWidth = 0,
    this.borderRadius = 5,
    this.borderColor = ThemeApp.infoCardBoxColor,
    this.backgroundColor,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w500,
  });

  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final double marginRight;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final Color? backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight),
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
    );
  }
}
