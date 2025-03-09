import 'package:ciland/features/films/widgets/movie_description.dart';
import 'package:ciland/features/films/widgets/movie_title.dart';
import 'package:ciland/features/movie_details/bloc/movie_details_bloc.dart';
import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.id});

  final String id;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MovieDetailsBloc(
            movieDetailsUseCase: GetIt.I<MovieDetailsUseCase>(),
          )..add(LoadMovieDetailsEvent(id: widget.id)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsIsLoadedState) {
                details = state.movieDetails;
                return Column(
                  children: [
                    SizedBox(
                      height: 800,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(details.primaryImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.black.withValues(alpha: 0.9),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  context.isMobileView ||
                                          context.isNarrowWebView
                                      ? 20
                                      : 80,
                              vertical: 70,
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 800),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MovieTitle(
                                    text: details.title,
                                    letterSpacing: 2,
                                  ),
                                  const SizedBox(height: 80),
                                  Row(
                                    children: [
                                      MovieTitle(
                                        text:
                                            details.averageRating
                                                .toString()
                                                .toUpperCase(),
                                        fontSize: 150,
                                      ),
                                      Icon(Icons.star),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Wrap(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        details.title.toUpperCase(),
                                        style: TextStyle(fontSize: 50),
                                      ),
                                      Text('·'),
                                      Text(
                                        details.startYear
                                            .toString()
                                            .toUpperCase(),
                                      ),
                                      Text('·'),
                                      Text(
                                        details.genres[0].toUpperCase(),
                                        style: TextStyle(fontSize: 50),
                                      ),
                                      if (details.isAdult)
                                        Text(
                                          '18+',
                                          style: TextStyle(fontSize: 50),
                                        ),
                                      Text('·',),
                                      for (var language
                                          in details.spokenLanguages)
                                        Text(
                                          '${language.toUpperCase()}·',
                                          style: TextStyle(fontSize: 50),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  MovieDescription(
                                    text: details.description,
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (state is MovieDetailsIsErrorLoadState) {
                return Center(child: Text('ERROR'));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
