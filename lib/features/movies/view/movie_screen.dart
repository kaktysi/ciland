import 'dart:async';

import 'package:ciland/app_config.dart';
import 'package:ciland/di.dart';
import 'package:ciland/features/movies/bloc/movies_bloc.dart';
import 'package:ciland/features/movies/entity/movie.dart';
import 'package:ciland/features/movies/models/movie_type.dart';
import 'package:ciland/features/movies/usecase/movies_usecase.dart';
import 'package:ciland/features/movies/widgets/movie_list_grid_view.dart';
import 'package:ciland/features/movies/widgets/search_field.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key, required this.movieType});

  final MovieType movieType;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<Movie> filmList = [];
  final provider = PageIndex();

  @override
  void initState() {
    super.initState();
    provider.changeIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Consumer<PageIndex>(
        builder:
            (context, provider, child) => BlocProvider(
              create: (context) {
                return MoviesBloc(moviesUseCase: getIt<MoviesUseCase>())..add(
                  LoadTopMovies(
                    movieType: widget.movieType.isMovie ? 'movies' : 'tv',
                  ),
                );
              },
              child: Builder(
                builder:
                    (context) => RefreshIndicator(
                      onRefresh: () async {
                        final completer = Completer();
                        BlocProvider.of<MoviesBloc>(context).add(
                          LoadTopMovies(
                            movieType:
                                widget.movieType.isMovie ? 'movies' : 'tv',
                            completer: completer,
                          ),
                        );
                      },
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                context.isMobileView || context.isNarrowWebView
                                    ? 20
                                    : 80,
                            vertical: 70,
                          ),
                          child: Column(
                            spacing: 38,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  spacing: 30,
                                  children: [
                                    Text(
                                      widget.movieType.isMovie
                                          ? 'Home / Films'
                                          : 'Home / Series',
                                      style: TextStyle(
                                        color: ThemeApp.subTitleColor2,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SearchField(
                                        onPressed: (value) {
                                          BlocProvider.of<MoviesBloc>(
                                            context,
                                          ).add(
                                            value.isNotEmpty
                                                ? LoadMoviesBySearch(
                                                  text: value,
                                                  movieType:
                                                      widget.movieType.name,
                                                )
                                                : LoadTopMovies(
                                                  movieType:
                                                      widget.movieType.isMovie
                                                          ? 'movies'
                                                          : 'tv',
                                                ),
                                          );
                                          provider.changeIndex(0);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                widget.movieType.isMovie
                                    ? 'Films Online'
                                    : 'Series Online',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                widget.movieType.isMovie
                                    ? 'The best movies in HD quality. Watch the latest movies online without advertising on Ciland.'
                                    : 'The best TV series in HD quality. Watch your favorite TV series online without ads on Amediateka. Subscribe on the website or in the Amediateka app and watch TV series online on the day of the premiere.',
                                style: TextStyle(
                                  color: ThemeApp.subTitleColor2,
                                  letterSpacing: 2,
                                ),
                              ),
                              BlocBuilder<MoviesBloc, MoviesState>(
                                builder: (context, state) {
                                  if (state is MoviesIsLoadedState) {
                                    filmList = state.movies;
                                    final pages =
                                        filmList.length ~/
                                            AppConfig.maxElementsOnPage +
                                        1;
                                    final lastPageElements =
                                        filmList.length %
                                        AppConfig.maxElementsOnPage;
                                    return filmList.isNotEmpty
                                        ? MovieListGridView(
                                          pages: pages,
                                          lastPageElements: lastPageElements,
                                          filmList: filmList,
                                          provider: provider,
                                        )
                                        : Center(child: Text('No results :('));
                                  }
                                  if (state is MoviesIsErrorLoadState) {
                                    return Center(child: Text("ERROR"));
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            ),
      ),
    );
  }
}
