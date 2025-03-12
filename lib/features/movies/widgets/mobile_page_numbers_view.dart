import 'package:ciland/features/movies/widgets/custom_action_button.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';

class MobilePageNumbersView extends StatelessWidget {
  const MobilePageNumbersView({
    super.key,
    required this.provider,
    required this.pages,
  });

  final PageIndex provider;
  final int pages;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: SizedBox(
            child: CustomActionButton(
              onPressed: () => provider.changeIndex(0),
              text: '1',
            ),
          ),
        ),
        if (provider.pageIndex > 2) Text('...'),
        for (int i = 2; i <= pages - 1; i++) ...[
          if (i == provider.pageIndex + 1 ||
              i == provider.pageIndex + 2 ||
              (i == provider.pageIndex && provider.pageIndex != 0))
            Flexible(
              child: SizedBox(
                child: CustomActionButton(
                  onPressed: () => provider.changeIndex(i - 1),
                  text: i.toString(),
                ),
              ),
            ),
        ],
        if (pages - provider.pageIndex > 2) Text('...'),
        Flexible(
          child: SizedBox(
            child: CustomActionButton(
              onPressed: () => provider.changeIndex(pages - 1),
              text: pages.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
