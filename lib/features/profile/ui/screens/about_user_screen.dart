import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_profile_image.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import '../widgets/_about_info_row_widget.dart';

class AboutUserScreen extends StatefulWidget {
  const AboutUserScreen({super.key});

  @override
  State<AboutUserScreen> createState() => _AboutUserScreenState();
}

class _AboutUserScreenState extends State<AboutUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("About Me"),
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
                  SizedBox(height: SizeConfig.getHeight(context, 16)),
                  Text(
                    "user_name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: SizeConfig.getHeight(context, 16)),

                  /// About Info Rows
                  _buildAboutInfoRow(context),
                  SizedBox(height: SizeConfig.getHeight(context, 16)),

                  /// Tab Bar Section
                  TabBar(

                    indicatorSize: TabBarIndicatorSize.label, // indicator text width অনুযায়ী হবে
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: "About"),
                      Tab(text: "Posts"),
                      Tab(text: "Reels"),
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This is About Tab content.\nYou can add more detailed info about the user here.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Posts Tab Content
                  Center(child: Text("User Posts will appear here")),

                  /// Reels Tab Content
                  Center(child: Text("User Reels will appear here")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// About Info Row
  Column _buildAboutInfoRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AboutInfoRow(title: 'Full Name: ', text: 'Rimu Akter'),
        SizedBox(height: SizeConfig.getHeight(context, 8)),
        AboutInfoRow(title: 'User Name: ', text: '@rimuakter'),
        SizedBox(height: SizeConfig.getHeight(context, 8)),
        AboutInfoRow(title: 'Location: ', text: 'Dhaka, Bangladesh'),
        SizedBox(height: SizeConfig.getHeight(context, 8)),
        AboutInfoRow(title: 'Gender: ', text: 'Female'),
        SizedBox(height: SizeConfig.getHeight(context, 8)),
        AboutInfoRow(title: 'Social Link: ', text: 'https://'),
      ],
    );
  }
}
