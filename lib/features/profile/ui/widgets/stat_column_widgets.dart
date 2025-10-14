import 'package:flutter/material.dart';


class StatColumnWidget extends StatelessWidget {
  const StatColumnWidget({
    super.key, required this.number, required this.title,
  });
  final String number;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        number,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineSmall,
      ),  Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],);
  }
}