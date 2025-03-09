import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/widgets/info_column.dart';
import 'package:flutter/material.dart';

class MoviePeopleInfo extends StatelessWidget {
  const MoviePeopleInfo({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        InfoColumn(
          title: 'Directors',
          info: details.directors.map((e) => e.toString()).join(', '),
        ),
        InfoColumn(
          title: 'Actors',
          info: details.cast
              .where((e) => e.isActor)
              .map((e) => e.toString())
              .join(', '),
        ),
        InfoColumn(
          title: 'Writers',
          info: details.writers.map((e) => e.toString()).join(', '),
        ),
      ],
    );
  }
}
