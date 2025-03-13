import 'package:ciland/features/movies/entity/film.dart';
import 'package:ciland/features/movies/widgets/animated_action_button.dart';
import 'package:ciland/features/movies/widgets/custom_action_button.dart';
import 'package:ciland/features/movies/widgets/gradient_background.dart';
import 'package:ciland/features/movies/widgets/info_widget.dart';
import 'package:ciland/features/movies/widgets/movie_description.dart';
import 'package:ciland/features/movies/widgets/movie_image.dart';
import 'package:ciland/features/movies/widgets/movie_title.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MovieCardItem extends StatefulWidget {
  final Movie film;
  const MovieCardItem({super.key, required this.film});

  @override
  State<MovieCardItem> createState() => _FilmCardItemState();
}

class _FilmCardItemState extends State<MovieCardItem> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => (MovieCardScaleProvider()),
      child: Consumer<MovieCardScaleProvider>(
        builder:
            (context, provider, child) => MouseRegion(
              onEnter: (context) => provider.onEnter(),
              onExit: (context) => provider.onExit(),
              child: Transform.scale(
                scale: provider.scale,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: ThemeApp.borderColor),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Stack(
                    children: [
                      MovieImage(imageUrl: widget.film.primaryImage),
                      Positioned.fill(
                        child: GradientBackground(
                          borderRadius: 21,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colorList:
                              ThemeApp.themeAppIsDark()
                                  ? [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 1),
                                  ]
                                  : [
                                    Colors.transparent,
                                    Colors.white.withValues(alpha: 0.6),
                                  ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MovieTitle(
                              text: widget.film.primarytitle,
                              letterSpacing: 2,
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                InfoWidget(
                                  text: widget.film.averageRating.toString(),
                                  horizontalPadding: 5,
                                  borderWidth: 2,
                                  borderColor: ThemeApp.borderColor2,
                                  borderRadius: 2,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                                Visibility(
                                  visible: widget.film.isAdult,
                                  child: InfoWidget(
                                    text: '18+',
                                    backgroundColor:
                                        ThemeApp.themeAppIsDark()
                                            ? ThemeApp.infoCardBoxColor
                                            : ThemeApp.infoCardBoxColor2,
                                  ),
                                ),
                                InfoWidget(
                                  text: widget.film.startYear.toString(),
                                  backgroundColor:
                                      ThemeApp.themeAppIsDark()
                                          ? ThemeApp.infoCardBoxColor
                                          : ThemeApp.infoCardBoxColor2,
                                ),
                                InfoWidget(
                                  text: widget.film.genres[0],
                                  backgroundColor:
                                      ThemeApp.themeAppIsDark()
                                          ? ThemeApp.infoCardBoxColor
                                          : ThemeApp.infoCardBoxColor2,
                                ),
                              ],
                            ),
                            MovieDescription(
                              text: widget.film.description,
                              height: 2,
                              maxLines: 3,
                            ),
                            if (!context.isMobileView) ...[
                              SizedBox(
                                width: double.infinity,
                                child: AnimatedActionButton(
                                  visibility: provider.visibility,
                                  text: 'Watch',
                                  onPressed: () {
                                    context.go(
                                      '/home/films/details/${widget.film.id}',
                                    );
                                  },
                                  backgroundColor: ThemeApp.buttonColor,
                                ),
                              ),
                            ],
                            if (context.isMobileView) ...[
                              SizedBox(
                                width: double.infinity,
                                child: CustomActionButton(
                                  text: 'Watch',
                                  onPressed: () {
                                    context.go(
                                      '/home/films/details/${widget.film.id}',
                                    );
                                  },
                                  backgroundColor: ThemeApp.buttonColor,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
