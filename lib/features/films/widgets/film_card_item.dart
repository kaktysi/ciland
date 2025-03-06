import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/theme/theme.dart';
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
            image: DecorationImage(
              image: NetworkImage(widget.film.primaryImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    widget.film.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: ThemeApp.borderColor2,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        widget.film.averageRating.toString(),
                        style: const TextStyle(fontSize: 8),
                      ),
                    ),
                    Visibility(
                      maintainAnimation: widget.film.isAdult,
                      maintainState: widget.film.isAdult,
                      maintainSize: widget.film.isAdult,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ThemeApp.infoCardBoxColor,
                        ),
                        child: Text(
                          '18+',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: ThemeApp.infoCardBoxColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        widget.film.startYear.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: ThemeApp.infoCardBoxColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        widget.film.genres[0],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.film.description,
                  style: const TextStyle(fontSize: 11, height: 2),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AnimatedOpacity(
                    opacity: visibility ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Visibility(
                      maintainState: visibility,
                      maintainAnimation: visibility,
                      maintainSize: visibility,
                      visible: visibility,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/home/films/details/${widget.film.id}');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeApp.buttonColor,
                        ),
                        child: const Text('Watch'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
