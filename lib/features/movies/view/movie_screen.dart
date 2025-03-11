import 'package:ciland/app_config.dart';
import 'package:ciland/features/movies/bloc/movies_bloc.dart';
import 'package:ciland/features/movies/entity/film.dart';
import 'package:ciland/features/movies/usecase/movies_usecase.dart';
import 'package:ciland/features/movies/widgets/movie_card_item.dart';
import 'package:ciland/features/movies/widgets/search_field.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<Movie> filmList = [];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              MoviesBloc(moviesUseCase: GetIt.I<MoviesUseCase>())
                ..add(LoadTopMovies()),
      child: Builder(
        builder:
            (context) => Scaffold(
              body: SingleChildScrollView(
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
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 30,
                          children: [
                            Text(
                              'Home / Movies',
                              style: TextStyle(
                                color: ThemeApp.subTitleColor2,
                                letterSpacing: 2,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: SearchField(
                                onPressed: (value) {
                                  BlocProvider.of<MoviesBloc>(context).add(
                                    value.isNotEmpty
                                        ? LoadMoviesBySearch(
                                          text: value,
                                          movieType: 'movie',
                                        )
                                        : LoadTopMovies(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 38),
                      Text(
                        'Films online',
                        style: TextStyle(letterSpacing: 2, fontSize: 28),
                      ),
                      const SizedBox(height: 38),
                      Text(
                        'The best movies in HD quality. Watch the latest movies online without advertising on Ciland.',
                        style: TextStyle(
                          color: ThemeApp.subTitleColor2,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 38),
                      BlocBuilder<MoviesBloc, MoviesState>(
                        builder: (context, state) {
                          if (state is MoviesIsLoadedState) {
                            filmList = state.movies;
                            final pages =
                                filmList.length ~/ AppConfig.maxElementsOnPage +
                                1;
                            final lastPageElements =
                                filmList.length % AppConfig.maxElementsOnPage;
                            return filmList.isNotEmpty
                                ? Column(
                                  spacing: 20,
                                  children: [
                                    Text(
                                      'Page ${_pageIndex + 1} of $pages pages',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 20,
                                      ),
                                    ),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                context.isWideWebView
                                                    ? 4
                                                    : context.isMediumWebView
                                                    ? 3
                                                    : context.isNarrowWebView
                                                    ? 2
                                                    : 1,
                                            crossAxisSpacing: 25,
                                            mainAxisSpacing: 25,
                                            childAspectRatio: 406 / 325,
                                          ),
                                      itemCount:
                                          _pageIndex + 1 == pages
                                              ? lastPageElements
                                              : AppConfig.maxElementsOnPage,
                                      itemBuilder: (context, index) {
                                        return MovieCardItem(
                                          film:
                                              filmList[_pageIndex *
                                                      AppConfig
                                                          .maxElementsOnPage +
                                                  index],
                                        );
                                      },
                                    ),
                                    context.isMobileView
                                        ? _mobilePageNumbersView(pages)
                                        : _webPageNumbersView(pages),
                                  ],
                                )
                                : Center(
                                  child: Center(child: Text('No results :(')),
                                );
                          }
                          if (state is MoviesIsErrorLoadState) {
                            return Center(child: Text("ERROR"));
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Row _webPageNumbersView(int pages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        for (int i = 1; i <= pages; i++) ...[
          Flexible(
            child: SizedBox(
              child: ElevatedButton(
                onPressed:
                    () => setState(() {
                      _pageIndex = i - 1;
                    }),
                child: Text('$i'),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Row _mobilePageNumbersView(int pages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Flexible(
          child: SizedBox(
            child: ElevatedButton(
              onPressed:
                  () => setState(() {
                    _pageIndex = 0;
                  }),
              child: Text('1'),
            ),
          ),
        ),
        if (_pageIndex > 2) Text('...'),
        for (int i = 2; i <= pages - 1; i++) ...[
          if (i == _pageIndex + 1 ||
              i == _pageIndex + 2 ||
              (i == _pageIndex && _pageIndex != 0))
            Flexible(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed:
                      () => setState(() {
                        _pageIndex = i - 1;
                      }),
                  child: Text('$i'),
                ),
              ),
            ),
        ],
        if (pages - _pageIndex > 2) Text('...'),
        Flexible(
          child: SizedBox(
            child: ElevatedButton(
              onPressed:
                  () => setState(() {
                    _pageIndex = pages - 1;
                  }),
              child: Text('$pages'),
            ),
          ),
        ),
      ],
    );
  }
}
