import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_circle_avatar.dart';
import 'package:ri_stream/features/common/common_widget/custom_container.dart';

import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class PostTitleProSubWidget extends StatelessWidget {
  const PostTitleProSubWidget({
    super.key,

    required this.textTheme, required this.title, required this.subtitle, required this.userName, required this.userImage,
  });


  final TextTheme textTheme;
  final String title;
  final String subtitle;
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.getHeight(context, 24))),
        SizedBox(height: SizeConfig.getHeight(context, 4)),
        Text(subtitle,
            style: textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: SizeConfig.getHeight(context, 16))),
        SizedBox(height: SizeConfig.getHeight(context, 8)),
        Row(
          children: [
            Column(
              children: [
                CustomCircleAvatar(
                    radius: 25, assetsPath: userImage),
                Text(userName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(width: 8),
            CustomContainer(
              padding: const EdgeInsets.symmetric(
                  horizontal: 6, vertical: 2),
              color: AppColors.primary,
              child: const Text("Subscribe",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}