import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/circular_icon_widget.dart';
import 'package:ri_stream/features/common_widget/custom_container.dart';
import 'package:ri_stream/features/common_widget/custom_profile_image.dart';
import 'package:ri_stream/features/profile/ui/screens/about_user_screen.dart';
import 'package:ri_stream/features/profile/ui/widgets/recent_post_card_widget.dart';
import 'package:ri_stream/features/profile/ui/widgets/stat_column_widgets.dart';
import 'package:ri_stream/utils/app_sizes.dart';

import '../../data/recent_post_card_item.dart' show recentPostcardItem;


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
                    "category",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w300,fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(context, 12)),
              ///bio text
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               "Intro: ",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w300,fontSize: 18),
              ),
              SizedBox(width: 4),
              Expanded(
                child:  Text(
                  "I am always active for your chat I am always active for your chat",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w300,fontSize: 12),
                ),
              ),
            ],
          ),



              SizedBox(height: SizeConfig.getHeight(context, 24)),
              ///share flow show screen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularIconCircleWidget(icon: Icons.message),

                  CustomContainer(
                    borderRadius: 24,
                   padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(context, 24),vertical:SizeConfig.getHeight(context, 6) ),
                      color: isDark?Colors.white12:Colors.red.shade900,
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
              SizedBox(height: SizeConfig.getHeight(context, 24)),
              ///number of
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                StatColumnWidget(number: '1M', title: 'Posts',),
                StatColumnWidget(number: '1M', title: 'Followers',),
                StatColumnWidget(number: '1M', title: 'Following',),
              ],),
              SizedBox(height: SizeConfig.getHeight(context, 24)),
              ///about me text
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUserScreen(),
                    ),
                  );
                },
                child: CustomContainer(
                  borderRadius: 24,
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(context, 48),vertical:SizeConfig.getHeight(context, 8) ),
                  color: isDark?Colors.white12:Colors.red.shade900,
                  child: Text(
                    "About Me",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(

                    "Recent Posts",

                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(),
                ],
              ),
          ///show recent post
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentPostcardItem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: SizeConfig.getWidth(context, 12),
              mainAxisSpacing: SizeConfig.getHeight(context, 12),
              childAspectRatio: 0.75, // card height/width ratio
            ),
            itemBuilder: (context, index) {
              final post = recentPostcardItem[index];
              return RecentPostCardWidget(
                imageUrl: post['image']!,
                title: post['title']!,
                subtitle: post['subtitle']!,
              );
            },
          )

            ],
          ),
        ),
      ),
    );
  }
}


