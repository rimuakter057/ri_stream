
import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_circle_avatar.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class NotificationTile extends StatelessWidget {
  final String userName;
  final String message;
  final DateTime time;
  final bool isRead;
  final bool isPinned;

  const NotificationTile({
    super.key,
    required this.userName,
    required this.message,
    required this.time,
    this.isRead = false,
    this.isPinned = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isRead
            ? (isDark ? Colors.white12 : Colors.grey[200])
            : (isDark ? Colors.white24 : Colors.white24),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Leading: Profile
          CustomCircleAvatar(assetsPath: AssetsPath.logo),

          const SizedBox(width: 12),

          // Middle: Title + Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: SizeConfig.getFont(context, 12),

                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${time.hour}:${time.minute.toString().padLeft(2, '0')}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: SizeConfig.getFont(context, 10),

                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 4), // gap between text and icons


          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  isRead ? Icons.check : Icons.check_circle_outline,
                  color: isRead ? Colors.grey : Colors.red.shade900,
                  size: SizeConfig.getWidth(context, 24),
                ),
              ),
              const SizedBox(width: 4), // ✅ gap কমানো
              GestureDetector(
                onTap: () {},
                child: Icon(
                  isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                  color: isPinned ? Colors.amber : Colors.grey,
                  size: SizeConfig.getWidth(context, 24),
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {},
                child:  Icon(Icons.delete_outline, color: Colors.red, size: SizeConfig.getWidth(context, 24),),
              ),
            ],
          ),



        ],
      ),
    );

  }
}

