import 'package:ciland/features/movies/widgets/movie_description.dart';
import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/widgets/info_column.dart';
import 'package:flutter/material.dart';

class MovieAdditionalInfo extends StatelessWidget {
  const MovieAdditionalInfo({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        MovieDescription(
          text: details.description,
          fontSize: 18,
          maxLines: 10,
          height: 1.2,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Expanded(
              child: InfoColumn(
                title: 'Votes',
                info: details.numVotes?.toString() ?? '-',
              ),
            ),
            Expanded(
              child: InfoColumn(
                title: 'Duration',
                info: details.duration,
              ),
            ),
            Expanded(
              child: InfoColumn(
                title: 'Budget',
                info: details.budgetUSD,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
