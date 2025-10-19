import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_container.dart';

import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class RecentPostCardWidget extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? subtitle;
 final double?height;
  const RecentPostCardWidget({
    super.key,
    required this.imageUrl,
    this.title,
    this.subtitle, this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomContainer(
      borderRadius: 16,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: SizeConfig.getHeight(context,height?? 180),
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
              Positioned(
                top: SizeConfig.getHeight(context, 12),
                left: SizeConfig.getWidth(context, 12),

                child:Row(children: [
                  Icon(Icons.favorite,color: AppColors.primary,),
                  SizedBox(width:SizeConfig.getWidth(context, 4),),
                  Text("110", style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                    color: AppColors.primary,
                  ),)
                ],)
              ),

              /// Gradient overlay for text visibility
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              /// Title & Subtitle floating at bottom (conditionally)
              if ((title != null && title!.isNotEmpty) ||
                  (subtitle != null && subtitle!.isNotEmpty))
                Positioned(
                  bottom: SizeConfig.getHeight(context, 12),
                  left: SizeConfig.getWidth(context, 12),
                  right: SizeConfig.getWidth(context, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null && title!.isNotEmpty)
                        Text(
                          title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      if (subtitle != null && subtitle!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(
                              top: title != null && title!.isNotEmpty
                                  ? SizeConfig.getHeight(context, 4)
                                  : 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                subtitle!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  color: Colors.white70,
                                ),
                              ),

                              Row(
                                children: [
                                  Icon(Icons.remove_red_eye,color: Colors.red.shade900,size: 12,),
                                  SizedBox(width: 4,),
                                  Text(
                                    "11.5k",

                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
