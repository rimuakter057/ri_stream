import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccountTextWidget extends StatelessWidget {
  final VoidCallback onTap;

  const HaveAccountTextWidget({super.key, required this.onTap, this.firstText, this.lastText});
    final String? firstText;
  final String? lastText;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:firstText?? "Already have an account ",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white24
              : Colors.black26,
        ), // normal style
        children: [
          TextSpan(
            text:lastText?? "Sign In",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
