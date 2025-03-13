import 'package:ciland/features/movies/widgets/gradient_background.dart';
import 'package:ciland/features/movie_details/bloc/movie_details_bloc.dart';
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart';
import 'package:ciland/features/movie_details/widgets/movie_mobile_info.dart';
import 'package:ciland/features/movie_details/widgets/movie_general_info.dart';
import 'package:ciland/features/movie_details/widgets/movie_web_info.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.id});

  final String id;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MovieDetailsBloc(
            movieDetailsUseCase: GetIt.I<MovieDetailsUseCase>(),
          )..add(LoadMovieDetailsEvent(id: widget.id)),
      child: AnimatedBuilder(
        animation: Provider.of<ThemeChange>(context),
        builder: (context, child) {
          return Theme(data: ThemeApp.theme, child: child ?? const SizedBox());
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(),
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsIsLoadedState) {
                  final details = state.movieDetails;
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
                                    image:
                                        details.primaryImage.isNotEmpty
                                            ? NetworkImage(details.primaryImage)
                                            : AssetImage(
                                              'assets/svg/no_picture.svg',
                                            ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: GradientBackground(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colorList:
                                    ThemeApp.themeAppIsDark()
                                        ? [
                                          Colors.transparent,
                                          Colors.black.withValues(alpha: 1),
                                        ]
                                        : [
                                          Colors.transparent,
                                          Colors.white.withValues(alpha: 0.7),
                                        ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right:
                                    context.isMobileView ||
                                            context.isNarrowWebView
                                        ? 20
                                        : 80,
                                left:
                                    context.isMobileView ||
                                            context.isNarrowWebView
                                        ? 20
                                        : 80,
                                top: 70,
                              ),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 800),
                                child: MovieGeneralInfo(details: details),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              context.isMobileView || context.isNarrowWebView
                                  ? 20
                                  : 80,
                          vertical: 20,
                        ),
                        child:
                            !context.isMobileView
                                ? MovieWebInfo(details: details)
                                : MovieMobileInfo(details: details),
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
      ),
    );
  }
}
