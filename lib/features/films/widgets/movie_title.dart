import 'package:ciland/features/films/widgets/film_card_item.dart';
import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key, required this.widget});

  final FilmCardItem widget;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        widget.film.title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
