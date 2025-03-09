import 'package:ciland/theme/theme.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 18, color: ThemeApp.subTitleColor2),
            ),
          ),
          const SizedBox(width: 20,),
          Flexible(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                info,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
