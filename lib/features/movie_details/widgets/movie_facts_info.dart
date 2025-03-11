import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/widgets/info_column.dart';
import 'package:flutter/material.dart';

class MovieFactsInfo extends StatelessWidget {
  const MovieFactsInfo({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        InfoColumn(title: 'Original Title', info: details.originalTitle),
        Visibility(
          visible: details.language != null,
          child: InfoColumn(title: 'Language', info: details.language ?? '-')),
        InfoColumn(
          title: 'Origin Countries',
          info: details.countriesOfOrigin.map((e) => e.toString()).join(', '),
        ),
        InfoColumn(
          title: 'Genres',
          info: details.genres.map((e) => e.toString()).join(', '),
        ),
      ],
    );
  }
}
