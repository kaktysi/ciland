import 'package:ciland/app_config.dart';
import 'package:ciland/features/movies/entity/film.dart';
import 'package:ciland/features/movies/widgets/mobile_page_numbers_view.dart';
import 'package:ciland/features/movies/widgets/movie_card_item.dart';
import 'package:ciland/features/movies/widgets/web_page_numbers_view.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';

class MovieListGridView extends StatelessWidget {
  const MovieListGridView({
    super.key,
    required this.pages,
    required this.lastPageElements,
    required this.filmList,
    required this.provider,
  });

  final int pages;
  final int lastPageElements;
  final List<Movie> filmList;
  final PageIndex provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Text(
          'Page ${provider.pageIndex + 1} of $pages pages',
          style: TextStyle(letterSpacing: 2, fontSize: 20),
        ),
        GridView.builder(
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
          itemCount:
              provider.pageIndex + 1 == pages
                  ? lastPageElements
                  : AppConfig.maxElementsOnPage,
          itemBuilder: (context, index) {
            return MovieCardItem(
              film:
                  filmList[provider.pageIndex * AppConfig.maxElementsOnPage +
                      index],
            );
          },
        ),
        context.isMobileView
            ? MobilePageNumbersView(provider: provider, pages: pages)
            : WebPageNumbersView(provider: provider, pages: pages),
      ],
    );
  }
}
