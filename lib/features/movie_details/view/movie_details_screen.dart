import 'package:ciland/features/films/widgets/custom_action_button.dart';
import 'package:ciland/features/films/widgets/dark_gradient_background.dart';
import 'package:ciland/features/films/widgets/movie_description.dart';
import 'package:ciland/features/films/widgets/movie_title.dart';
import 'package:ciland/features/movie_details/bloc/movie_details_bloc.dart';
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

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
      child: Scaffold(
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
                                  image: NetworkImage(details.primaryImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: DarkGradientBackground(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MovieTitle(
                                    text: details.primarytitle,
                                    fontSize: 70,
                                  ),
                                  const SizedBox(height: 28),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/imdb.svg',
                                        height: 28,
                                      ),
                                      const SizedBox(width: 10),
                                      MovieTitle(
                                        text:
                                            details.averageRating
                                                .toString()
                                                .toUpperCase(),
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
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ThemeApp.subTitleColor3,
                                        ),
                                      ),
                                      Icon(
                                        Icons.volume_up,
                                        size: 20,
                                        color: ThemeApp.subTitleColor3,
                                      ),
                                      Text(
                                        details.spokenLanguages
                                            .map(
                                              (language) =>
                                                  language.toUpperCase(),
                                            )
                                            .join(', '),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ThemeApp.subTitleColor3,
                                        ),
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
                              ),
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
                              ? SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 3,
                                  children: [
                                    Text(
                                      details.primarytitle,
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    Row(
                                      spacing: 20,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            spacing: 10,
                                            children: [
                                              MovieDescription(
                                                text: details.description,
                                                fontSize: 18,
                                                maxLines: 10,
                                                height: 1.2,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                spacing: 10,
                                                children: [
                                                  Expanded(
                                                    child: InfoColumn(
                                                      title: 'Votes',
                                                      info:
                                                          details.numVotes
                                                              .toString(),
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
                                                      info:
                                                          details.budgetUSD
                                                              .toString(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            spacing: 10,
                                            children: [
                                              InfoColumn(
                                                title: 'Directors',
                                                info: details.directors
                                                    .map((e) => e.toString())
                                                    .join(', '),
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
                                                info: details.writers
                                                    .map((e) => e.toString())
                                                    .join(', '),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            spacing: 10,
                                            children: [
                                              InfoColumn(
                                                title: 'Original Title',
                                                info: details.originalTitle,
                                              ),
                                              InfoColumn(
                                                title: 'Language',
                                                info: details.language ?? '-',
                                              ),
                                              InfoColumn(
                                                title: 'Origin Countries',
                                                info: details.countriesOfOrigin
                                                    .map((e) => e.toString())
                                                    .join(', '),
                                              ),
                                              InfoColumn(
                                                title: 'Genres',
                                                info: details.genres
                                                    .map((e) => e.toString())
                                                    .join(', '),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 200,
                                    //   child: ListView.builder(
                                    //     shrinkWrap: true,
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemCount:
                                    //         details.cast
                                    //             .where((e) => e.isActor)
                                    //             .length,
                                    //     itemBuilder: (context, index) {
                                    //       var actors =
                                    //           details.cast
                                    //               .where((e) => e.isActor)
                                    //               .toList();
                                    //       return Padding(
                                    //         padding: const EdgeInsets.symmetric(
                                    //           horizontal: 20,
                                    //         ),
                                    //         child: Column(
                                    //           children: [
                                    //             CircleAvatar(
                                    //               radius: 70,
                                    //               child: Icon(
                                    //                 Icons.person,
                                    //                 size: 70,
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               actors[index].fullName,
                                    //               style: TextStyle(
                                    //                 fontSize: 18,
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                              : Column(
                                spacing: 10,
                                children: [
                                  Text(
                                    details.primarytitle,
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  MovieDescription(
                                    text: details.description,
                                    fontSize: 18,
                                    maxLines: 10,
                                    height: 1.2,
                                  ),
                                  InfoRow(
                                    title: 'Original Title',
                                    info: details.originalTitle,
                                  ),
                                  InfoRow(
                                    title: 'Votes',
                                    info: details.numVotes.toString(),
                                  ),
                                  InfoRow(
                                    title: 'Duration',
                                    info: details.duration,
                                  ),
                                  InfoRow(
                                    title: 'Budget',
                                    info: details.budgetUSD.toString(),
                                  ),
                                  InfoRow(
                                    title: 'Directors',
                                    info: details.directors
                                        .map((e) => e.toString())
                                        .join(', '),
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
                                    info: details.writers
                                        .map((e) => e.toString())
                                        .join(', '),
                                  ),
                                  InfoRow(
                                    title: 'Language',
                                    info: details.language ?? '-',
                                  ),
                                  InfoRow(
                                    title: 'Origin Countries',
                                    info: details.countriesOfOrigin
                                        .map((e) => e.toString())
                                        .join(', '),
                                  ),
                                  InfoRow(
                                    title: 'Genres',
                                    info: details.genres
                                        .map((e) => e.toString())
                                        .join(', '),
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

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 18, color: ThemeApp.subTitleColor2),
            ),
          ),
          const SizedBox(width: 20,),
          Flexible(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                info,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, color: ThemeApp.subTitleColor2),
        ),
        Text(info, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
