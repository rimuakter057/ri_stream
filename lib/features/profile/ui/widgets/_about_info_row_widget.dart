import 'package:flutter/material.dart';



class AboutInfoRow extends StatelessWidget {
  const AboutInfoRow({
    super.key, required this.title, required this.text,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium, ),
        ),
      ],
    );
  }
}