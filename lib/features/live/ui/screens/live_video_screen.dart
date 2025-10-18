import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_container.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/live/data/comment_list.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class LiveVideoScreen extends StatefulWidget {
  const LiveVideoScreen({super.key});

  @override
  State<LiveVideoScreen> createState() => _LiveVideoScreenState();
}

class _LiveVideoScreenState extends State<LiveVideoScreen> {
  bool showComments = false;

  int views = 1200;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 🔹 Background Image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/live_back_image1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Top Section (Title, Subtitle, Views)
          Positioned(
            top: SizeConfig.getHeight(context, 50),
            left: SizeConfig.getWidth(context, 20),
            right: SizeConfig.getWidth(context, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Live Video Title",
                  style: textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.getHeight(context, 24),
                  ),
                ),
                SizedBox(height: SizeConfig.getHeight(context, 2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Live Subtitle or Description",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          fontSize: SizeConfig.getHeight(context, 16),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.getWidth(context, 6)),
                    Column(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white70,
                          size: SizeConfig.getHeight(context, 18),
                        ),
                        SizedBox(height: SizeConfig.getHeight(context, 4)),
                        Text(
                          "$views views",
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.white70,
                            fontSize: SizeConfig.getHeight(context, 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 Like & Comment Buttons
          Positioned(
            bottom: SizeConfig.getHeight(context, 100),
            right: SizeConfig.getWidth(context, 20),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: SizeConfig.getHeight(context, 32),
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: SizeConfig.getHeight(context, 10)),
                IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: SizeConfig.getHeight(context, 30),
                  ),
                  onPressed: () {
                    setState(() {
                      showComments = !showComments;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: SizeConfig.getHeight(context, 32),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // 🔹 LIVE Badge
          Positioned(
            top: SizeConfig.getHeight(context, 50),
            right: SizeConfig.getWidth(context, 20),
            child: CustomContainer(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getWidth(context, 8),
                vertical: SizeConfig.getHeight(context, 2),
              ),
              color: Colors.red.shade900,
              child: Text(
                "LIVE",
                style: textTheme.bodySmall!.copyWith(color: Colors.white),
              ),
            ),
          ),

          // 🔹 Comment List
          if (showComments)
            Positioned(
              bottom: SizeConfig.getHeight(context, 150),
              left: SizeConfig.getWidth(context, 20),
              right: SizeConfig.getWidth(context, 80),
              child: Container(
                padding: EdgeInsets.all(SizeConfig.getHeight(context, 10)),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.getHeight(context, 10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: comments
                      .map(
                        (c) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.getHeight(context, 4),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              c,
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

          // 🔹 Comment Input Box with Send Icon
          Positioned(
            bottom: SizeConfig.getHeight(context, 20),
            left: SizeConfig.getWidth(context, 20),
            right: SizeConfig.getWidth(context, 20),

            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(hintText: "Write a comment..."),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (commentController.text.isNotEmpty) {
                      setState(() {
                        comments.add(commentController.text);
                        commentController.clear();
                      });
                    }
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.red.shade900,
                    size: SizeConfig.getHeight(context, 32),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
