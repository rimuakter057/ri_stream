import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_container.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class RecentPostCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const RecentPostCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomContainer(
      borderRadius: 16,
      color: Colors.transparent, // let image show fully
      padding: EdgeInsets.zero,  // no padding
      child: SizedBox(
        height: SizeConfig.getHeight(context, 180), // full card height
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              /// Full image
              Image.asset(
                imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              /// Gradient overlay for text visibility
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              /// Title & Subtitle floating at bottom
              Positioned(
                bottom: SizeConfig.getHeight(context, 12),
                left: SizeConfig.getWidth(context, 12),
                right: SizeConfig.getWidth(context, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: SizeConfig.getHeight(context, 4)),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
