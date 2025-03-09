import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/widgets/movie_additional_info.dart';
import 'package:ciland/features/movie_details/widgets/movie_facts_info.dart';
import 'package:ciland/features/movie_details/widgets/movie_people_info.dart';
import 'package:flutter/material.dart';

class MovieWebInfo extends StatelessWidget {
  const MovieWebInfo({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 3,
      children: [
        Text(details.primarytitle, style: TextStyle(fontSize: 28)),
        Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: MovieAdditionalInfo(details: details)),
            Expanded(flex: 1, child: MoviePeopleInfo(details: details)),
            Expanded(flex: 1, child: MovieFactsInfo(details: details)),
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
    );
  }
}
