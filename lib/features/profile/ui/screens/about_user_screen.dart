import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_profile_image.dart';
import 'package:ri_stream/features/profile/data/about_user_list.dart';
import 'package:ri_stream/features/profile/ui/widgets/_about_info_row_widget.dart';
import 'package:ri_stream/utils/app_sizes.dart';

import 'edit_profile_screen.dart';


class AboutUserScreen extends StatefulWidget {
  const AboutUserScreen({super.key});

  @override
  State<AboutUserScreen> createState() => _AboutUserScreenState();
}

class _AboutUserScreenState extends State<AboutUserScreen> {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("About Me"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomProfileImage(),
              SizedBox(height: SizeConfig.getHeight(context, 2)),
              Text(
                "user_name",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.getHeight(context, 4)),
            ],
          ),

          // About Info Rows
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: aboutData.length,
            separatorBuilder: (_, __) =>
                SizedBox(height: SizeConfig.getHeight(context, 8)),
            itemBuilder: (context, index) {
              final item = aboutData[index];
              return Card(
                elevation: 3, // subtle shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // smooth corners
                ),
                margin: EdgeInsets.zero, // spacing handled by separatorBuilder
                color: isDark ? Colors.grey[850] : Colors.white, // theme-aware background
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item['text']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? Colors.white60 : Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

          ),
        ],
      ),
    );
  }
}
