import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/circular_icon_widget.dart';
import 'package:ri_stream/features/common_widget/custom_container.dart';
import 'package:ri_stream/features/common_widget/custom_profile_image.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///profile section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomProfileImage(),
                  SizedBox(height: SizeConfig.getHeight(context, 16)),
                  Text(
                    "Rimu Akter",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: SizeConfig.getHeight(context, 4)),
                  Text(
                    "Rimu Akter subtitle",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(context, 16)),
              Text(
                "I am always active for your chat",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.getHeight(context, 24)),
              ///share flow show screen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularIconCircleWidget(icon: Icons.message),

                  CustomContainer(
                    borderRadius: 24,
                   padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                      color: isDark?Colors.white12:Colors.teal,
                    child: Text(
                      "Follow",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.w800),
                    ),
                  ),

                  CircularIconCircleWidget(icon: Icons.share),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
