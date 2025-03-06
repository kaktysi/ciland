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
                    DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(details.primaryImage),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              context.isMobileView || context.isNarrowWebView
                                  ? 20
                                  : 80,
                          vertical: 70,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
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
