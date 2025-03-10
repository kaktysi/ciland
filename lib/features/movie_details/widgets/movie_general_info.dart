import 'package:ciland/features/movies/widgets/custom_action_button.dart';
import 'package:ciland/features/movies/widgets/movie_description.dart';
import 'package:ciland/features/movies/widgets/movie_title.dart';
import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieGeneralInfo extends StatelessWidget {
  const MovieGeneralInfo({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MovieTitle(text: details.primarytitle, fontSize: 70),
        const SizedBox(height: 28),
        Row(
          children: [
            SvgPicture.asset('assets/svg/imdb.svg', height: 28),
            const SizedBox(width: 10),
            MovieTitle(
              text: details.averageRating.toString().toUpperCase(),
              fontSize: 28,
            ),
            Icon(Icons.star, size: 20),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 5,
          children: [
            Text(
              '${details.primarytitle.toUpperCase()} · '
              '${details.startYear.toString().toUpperCase()}'
              '${!details.movieType.isMovie ? ' - ${details.endYear.toString().toUpperCase()}' : ''} · '
              '${details.genres[0].toUpperCase()}${details.isAdult ? ' · 18+' : ''} · ',
              style: TextStyle(fontSize: 18, color: ThemeApp.subTitleColor3),
            ),
            Icon(Icons.volume_up, size: 20, color: ThemeApp.subTitleColor3),
            Text(
              details.spokenLanguages
                  .map((language) => language.toUpperCase())
                  .join(', '),
              style: TextStyle(fontSize: 18, color: ThemeApp.subTitleColor3),
            ),
          ],
        ),
        const SizedBox(height: 20),
        MovieDescription(
          text: details.description,
          fontSize: 22,
          height: 2,
          maxLines: 10,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 120,
          child: CustomActionButton(
            text: 'Watch',
            onPressed: () {},
            backgroundColor: ThemeApp.buttonColor,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
