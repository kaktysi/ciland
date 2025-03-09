import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/films/widgets/animated_action_button.dart';
import 'package:ciland/features/films/widgets/custom_action_button.dart';
import 'package:ciland/features/films/widgets/dark_gradient_background.dart';
import 'package:ciland/features/films/widgets/info_widget.dart';
import 'package:ciland/features/films/widgets/movie_description.dart';
import 'package:ciland/features/films/widgets/movie_image.dart';
import 'package:ciland/features/films/widgets/movie_title.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilmCardItem extends StatefulWidget {
  final Film film;
  const FilmCardItem({super.key, required this.film});

  @override
  State<FilmCardItem> createState() => _FilmCardItemState();
}

class _FilmCardItemState extends State<FilmCardItem> {
  bool visibility = false;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:
          (_) => setState(() {
            scale = 1.05;
            visibility = true;
          }),
      onExit:
          (_) => setState(() {
            scale = 1.00;
            visibility = false;
          }),
      child: Transform.scale(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: ThemeApp.borderColor),
            borderRadius: BorderRadius.circular(21),
          ),
          child: Stack(
            children: [
              MovieImage(imageUrl: widget.film.primaryImage),
              Positioned.fill(
                child: DarkGradientBackground(
                  borderRadius: 21,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieTitle(text: widget.film.primarytitle, letterSpacing: 2),
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
                            backgroundColor: ThemeApp.infoCardBoxColor,
                          ),
                        ),
                        InfoWidget(
                          text: widget.film.startYear.toString(),
                          backgroundColor: ThemeApp.infoCardBoxColor,
                        ),
                        InfoWidget(
                          text: widget.film.genres[0],
                          backgroundColor: ThemeApp.infoCardBoxColor,
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
                          visibility: visibility,
                          text: 'Watch',
                          onPressed: () {
                            context.go('/home/films/details/${widget.film.id}');
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
                            context.go('/home/films/details/${widget.film.id}');
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
    );
  }
}
