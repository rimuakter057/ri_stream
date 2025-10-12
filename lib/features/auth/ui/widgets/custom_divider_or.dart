import 'package:flutter/material.dart';


class CustomDividerOr extends StatelessWidget {
  const CustomDividerOr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left divider
        Expanded(
          child: Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white24
                : Colors.black26,
            thickness: 1,
          ),
        ),

        // OR Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Right divider
        Expanded(
          child: Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white24
                : Colors.black26,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}