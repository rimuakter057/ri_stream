import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_drawer.dart';
import 'package:ri_stream/features/home/data/home_post_list.dart';
import 'package:ri_stream/features/home/data/story_item.dart';
import 'package:ri_stream/features/notification/ui/screens/notification_screen.dart';
import 'package:ri_stream/features/profile/ui/screens/profile_screen.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          },
          child: CustomAssetImage(assetsPath: AssetsPath.logo),
        ),
        title: const Text("RiStream"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 32)),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            showBadge: true,
            badgeContent: const Text('3', style: TextStyle(color: Colors.white, fontSize: 12)),
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.red.shade900, padding: const EdgeInsets.all(6)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationScreen()),
                );
              },
              icon: const Icon(Icons.notifications_outlined, size: 28),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Stories Section
          SliverToBoxAdapter(
            child: SizedBox(
              height: SizeConfig.getHeight(context, 230),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1, // ১টা বেশি — কারণ ১টা 'Add Story' কার্ড যোগ করব
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // 🧩 প্রথম আইটেম = Add Story কার্ড
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(context, 8)),
                      child: GestureDetector(
                        onTap: () {
                          // এখানে add story action দেবে
                        },
                        child: Container(
                          width: SizeConfig.getWidth(context, 120),
                          height: SizeConfig.getHeight(context, 230),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConfig.getHeight(context, 12)),
                            color: Colors.grey.shade800,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: SizeConfig.getHeight(context, 25),
                                backgroundColor: Colors.grey.shade700,
                                child: const Icon(Icons.add, color: Colors.white, size: 30),
                              ),
                              SizedBox(height: SizeConfig.getHeight(context, 10)),
                              const Text(
                                "Add Story",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  // 🧩 বাকিগুলো = তোমার আগের story container (এই অংশটাই `yourExistingStoryCard` ছিল)
                  final story = stories[index - 1]; // কারণ 0 index এ add story চলে গেছে

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(context, 8)),
                    child: Container(
                      height: SizeConfig.getHeight(context, 230),
                      width: SizeConfig.getWidth(context, 120),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.getHeight(context, 12)),
                        image: DecorationImage(
                          image: AssetImage(story['backgroundImage']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.getHeight(context, 12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: SizeConfig.getHeight(context, 18),
                                  backgroundImage: AssetImage(story['profileImage']!),
                                ),
                                SizedBox(width: SizeConfig.getWidth(context, 8)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        story['name']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        story['time']!,
                                        style: const TextStyle(color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )


            ),
          ),

          // News Feed Title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(context, 16), horizontal: 16),
              child: Text("News Feed", style: theme.textTheme.headlineMedium),
            ),
          ),

          // Posts Section - Full Screen Scroll
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final post = homePostList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.getHeight(context, 8),
                    horizontal: SizeConfig.getWidth(context, 8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.getHeight(context, 20),
                            backgroundImage: AssetImage(post['profileImage']!),
                          ),
                          SizedBox(width: SizeConfig.getWidth(context, 8)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post['profileName']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                post['time']!,
                                style: TextStyle(
                                  fontSize: SizeConfig.getHeight(context, 12),
                                  color: isDark ? Colors.white70 : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Icon(Icons.more_horiz, color: isDark ? Colors.white : Colors.black),
                        ],
                      ),
                      SizedBox(height: SizeConfig.getHeight(context, 8)),

                      // Caption
                      if (post['caption'] != null)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(context, 4)),
                          child: Text(
                            post['caption']!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),

                      // Media
                      Container(
                        height: SizeConfig.getHeight(context, 400), // full screen approx
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.getHeight(context, 8)),
                          image: DecorationImage(
                            image: AssetImage(post['media']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.getHeight(context, 8)),

                      // Like / Comment / Share
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(children: [Icon(Icons.thumb_up_alt_outlined, color: Colors.grey), SizedBox(width: 4), Text('Like', style: theme.textTheme.bodyMedium)]),
                          Row(children: [Icon(Icons.comment_outlined, color: Colors.grey), SizedBox(width: 4), Text('Comment', style: theme.textTheme.bodyMedium)]),
                          Row(children: [Icon(Icons.share_outlined, color: Colors.grey), SizedBox(width: 4), Text('Share', style: theme.textTheme.bodyMedium)]),
                        ],
                      ),
                      SizedBox(height: SizeConfig.getHeight(context, 16)),
                      Divider(color: isDark ? Colors.white12 : Colors.grey.shade300),
                    ],
                  ),
                );
              },
              childCount: homePostList.length,
            ),
          ),
        ],
      ),
    );
  }
}

