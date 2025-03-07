import 'package:ciland/features/movie_details/bloc/movie_details_bloc.dart';
import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart';
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [],
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
