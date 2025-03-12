import 'package:ciland/features/movies/widgets/custom_action_button.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';

class WebPageNumbersView extends StatelessWidget {
  const WebPageNumbersView({
    super.key,
    required this.provider,
    required this.pages,
  });

  final PageIndex provider;
  final int pages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        for (int i = 1; i <= pages; i++)
          Flexible(
            child: SizedBox(
              child: CustomActionButton(
                onPressed: () {
                  provider.changeIndex(i - 1);
                },
                text: i.toString(),
              ),
            ),
          ),
      ],
    );
  }
}
