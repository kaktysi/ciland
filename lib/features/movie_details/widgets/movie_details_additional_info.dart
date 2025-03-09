import 'package:ciland/features/films/widgets/movie_description.dart';
import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/widgets/info_row.dart';
import 'package:flutter/material.dart';

class MovieMobileInfo extends StatelessWidget {
  final MovieDetails details;

  const MovieMobileInfo({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(details.primarytitle, style: TextStyle(fontSize: 28)),
        MovieDescription(
          text: details.description,
          fontSize: 18,
          maxLines: 10,
          height: 1.2,
        ),
        InfoRow(title: 'Original Title', info: details.originalTitle),
        InfoRow(title: 'Votes', info: details.numVotes.toString()),
        InfoRow(title: 'Duration', info: details.duration),
        InfoRow(title: 'Budget', info: details.budgetUSD.toString()),
        InfoRow(
          title: 'Directors',
          info: details.directors.map((e) => e.toString()).join(', '),
        ),
        InfoRow(
          title: 'Actors',
          info: details.cast
              .where((e) => e.isActor)
              .map((e) => e.toString())
              .join(', '),
        ),
        InfoRow(
          title: 'Writers',
          info: details.writers.map((e) => e.toString()).join(', '),
        ),
        InfoRow(title: 'Language', info: details.language ?? '-'),
        InfoRow(
          title: 'Origin Countries',
          info: details.countriesOfOrigin.map((e) => e.toString()).join(', '),
        ),
        InfoRow(
          title: 'Genres',
          info: details.genres.map((e) => e.toString()).join(', '),
        ),
      ],
    );
  }
}
