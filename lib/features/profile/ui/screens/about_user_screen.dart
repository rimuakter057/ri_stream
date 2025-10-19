import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_profile_image.dart';

import 'package:ri_stream/features/profile/data/recent_post_card_item.dart';
import 'package:ri_stream/features/profile/data/saved_section_item.dart';
import 'package:ri_stream/features/profile/ui/screens/edit_profile_screen.dart';
import 'package:ri_stream/features/profile/ui/widgets/recent_post_card_widget.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';
import '../widgets/_about_info_row_widget.dart';

class AboutUserScreen extends StatefulWidget {
  const AboutUserScreen({super.key});

  @override
  State<AboutUserScreen> createState() => _AboutUserScreenState();
}

class _AboutUserScreenState extends State<AboutUserScreen> {
  @override
  Widget build(BuildContext context) {
   final isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("About Me"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const
                  EditProfileScreen()), // target screen
                );
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile Section
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomProfileImage(),
                  SizedBox(height: SizeConfig.getHeight(context, 2)),
                  Text(
                    "user_name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: SizeConfig.getHeight(context, 4)),

                  /// About Info Rows
                  _buildAboutInfoRow(context),


                  /// Tab Bar Section
                  TabBar(
                    dividerHeight: 0.08,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor:isDark?Colors.white: Colors.red.shade900,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: isDark?Colors.white: Colors.red.shade900,
                     labelStyle: TextStyle(fontSize: 18),
                    tabs: [

                      Tab(text: "photos"),
                      Tab(text: "videos"),
                      Tab(text: "save"),
                    ],
                  ),
                ],
              ),
            ),

            /// TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  /// About Tab Content
                  _buildPhotosSection(context),


                  ///show videos post
                  _buildVideosSection(context),
                  ///save section
                  _buildSaveSection(isDark),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
///photos tab
  GridView _buildPhotosSection(BuildContext context) {
    return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentPostcardItem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: SizeConfig.getWidth(context, 12),
                    mainAxisSpacing: SizeConfig.getHeight(context, 12),

                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(AssetsPath.image1,),
                                fit: BoxFit.cover,
                              )
                            ),
                    );
                  },
                );
  }
///video section
  GridView _buildVideosSection(BuildContext context) {
    return GridView.builder(
                  shrinkWrap: true,
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
                );
  }
///save section
  ListView _buildSaveSection(bool isDark) {
    return ListView.builder(
                  itemCount: savedSections.length,
                  itemBuilder: (context, index) {
                    final section = savedSections[index];

                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.getWidth(context, 12),  ),
                      child: SizedBox(
                        height: SizeConfig.getHeight(context, 80), // card height responsive
                        child: Card(
                          color: isDark ? Colors.white12 : Colors.red.shade900,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              // Left Image
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  section.previewImage,
                                  width: SizeConfig.getWidth(context, 80),   // width proportional
                                  height: SizeConfig.getHeight(context, 80), // match card height
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Right Content
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.getWidth(context, 12),
                                    vertical: SizeConfig.getHeight(context, 8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center, // vertical center
                                    children: [
                                      Text(
                                        section.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.getHeight(context, 4)),
                                      Text(
                                        "${section.itemsCount} items",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Trailing Icon
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
  }

  /// About Info Row
  Column _buildAboutInfoRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AboutInfoRow(title: 'Full Name: ', text: 'Rimu Akter'),
        SizedBox(height: SizeConfig.getHeight(context, 2)),
        AboutInfoRow(title: 'User Name: ', text: '@rimuakter'),
        SizedBox(height: SizeConfig.getHeight(context, 2)),
        AboutInfoRow(title: 'Email: ', text: 'mail@gmail.com'),
        SizedBox(height: SizeConfig.getHeight(context, 2)),
        AboutInfoRow(title: 'Birth Date: ', text: '08/12/2005'),
        SizedBox(height: SizeConfig.getHeight(context, 2)),
        AboutInfoRow(title: 'Gender: ', text: 'Female'),
        SizedBox(height: SizeConfig.getHeight(context, 2)),
        AboutInfoRow(title: 'Location: ', text: 'Dhaka, Bangladesh'),
        SizedBox(height: SizeConfig.getHeight(context, 2)),
        AboutInfoRow(title: 'Social Link: ', text: 'https://'),
      ],
    );
  }
}
