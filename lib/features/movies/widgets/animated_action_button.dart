import 'package:ciland/features/movies/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class AnimatedActionButton extends StatelessWidget {
  const AnimatedActionButton({
    super.key,
    required this.visibility,
    required this.text,
    required this.onPressed,
    this.animationMillisecondsDuration = 200,
    this.backgroundColor,
  });

  final bool visibility;
  final String text;
  final void Function() onPressed;
  final int animationMillisecondsDuration;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visibility ? 1.0 : 0.0,
      duration: Duration(milliseconds: animationMillisecondsDuration),
      child: Visibility(
        visible: visibility,
        child: CustomActionButton(
          text: text,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
