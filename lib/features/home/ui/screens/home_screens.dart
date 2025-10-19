import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_drawer.dart';
import 'package:ri_stream/features/home/data/story_item.dart';
import 'package:ri_stream/features/notification/ui/screens/notification_screen.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  final List<Map<String, String>> posts = const [
    {
      'profileName': 'Alice',
      'profileImage': "assets/icons/logo.png",
      'time': '2h',
      'media': 'assets/images/image1.png',
      'caption': 'Beautiful sunset!'
    },
    {
      'profileName': 'Bob',
      'profileImage': 'assets/icons/logo.png',
      'time': '3h',
      'media': 'assets/images/image1.png',
      'caption': 'Morning vibes ☀️'
    },
    {
      'profileName': 'Charlie',
      'profileImage': 'assets/icons/logo.png',
      'time': '5h',
      'media': 'assets/images/image1.png',
      'caption': 'Workout time!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(

        title: const Text("RiStream"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 32,)),
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  showBadge: true,
                  badgeContent: const Text(
                    '3', // unread count
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.red.shade900, // badge color
                    padding: EdgeInsets.all(6),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationScreen(),
                        ), // target screen
                      );
                    },
                    icon: const Icon(Icons.notifications_outlined, size: 28),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),


      body: SafeArea(
        child: Column(
          children: [
            //story
            SizedBox(
              height: SizeConfig.getHeight(context, 230),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: SizeConfig.getHeight(context, 14),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        story['time']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

           SizedBox(height: SizeConfig.getHeight(context, 16),),
            Text("News Feed",  style: Theme.of(context).textTheme.headlineMedium,) ,
            SizedBox(height: SizeConfig.getHeight(context, 16),),

            // Post section
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.getHeight(context, 8),
                      horizontal: SizeConfig.getWidth(context, 8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile info row
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
                            Spacer(),
                            Icon(
                              Icons.more_horiz,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.getHeight(context, 8)),

                        // Caption
                        if (post['caption'] != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(context, 4)),
                            child: Text(
                              post['caption']!,
                              style: Theme.of(context).textTheme.bodyMedium,

                            ),
                          ),

                        // Media
                        Container(
                          height: SizeConfig.getHeight(context, 200),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            image: DecorationImage(
                              image: AssetImage(post['media']!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(SizeConfig.getHeight(context, 8)),
                          ),
                        ),
                        SizedBox(height: SizeConfig.getHeight(context, 8)),

                        // Like / Comment / Share row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.thumb_up_alt_outlined, size: SizeConfig.getHeight(context, 20), color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Like',
                                  style: Theme.of(context).textTheme.bodyMedium,

                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.comment_outlined, size: SizeConfig.getHeight(context, 20), color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Comment',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.share_outlined, size: SizeConfig.getHeight(context, 20), color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Share',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.getHeight(context, 16)),
                        Divider(color: isDark ? Colors.white12 : Colors.grey.shade300),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
