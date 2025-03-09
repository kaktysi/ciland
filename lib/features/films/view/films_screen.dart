import 'package:ciland/features/films/bloc/films_bloc.dart';
import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/films/usecase/films_usecase.dart';
import 'package:ciland/features/films/widgets/film_card_item.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({super.key});

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  List<Film> filmList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FilmsBloc(filmsUseCase: GetIt.I<FilmsUseCase>())
                ..add(LoadTopFilms()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  context.isMobileView || context.isNarrowWebView ? 20 : 80,
              vertical: 70,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home / Films',
                  style: TextStyle(
                    color: ThemeApp.subTitleColor2,
                    letterSpacing: 2,
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
                BlocBuilder<FilmsBloc, FilmsState>(
                  builder: (context, state) {
                    if (state is FilmsIsLoadedState) {
                      filmList = state.films;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        itemCount: filmList.length,
                        itemBuilder: (context, index) {
                          return FilmCardItem(film: filmList[index]);
                        },
                      );
                    }
                    if (state is FilmsIsErrorLoadState) {
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
    );
  }
}
