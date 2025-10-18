import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_circle_avatar.dart';
import 'package:ri_stream/features/common_widget/custom_container.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/live/data/comment_list.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class ShortVideoScreen extends StatefulWidget {
  const ShortVideoScreen({super.key});

  @override
  State<ShortVideoScreen> createState() => _ShortVideoScreenState();
}

class _ShortVideoScreenState extends State<ShortVideoScreen> {
  bool showComments = false;

  int views = 1200;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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

          /// 🔹 bottom Section (Title, Subtitle, subscription)
          Positioned(
            bottom: SizeConfig.getHeight(context, 60),
            left: SizeConfig.getWidth(context, 20),
            right: SizeConfig.getWidth(context, 80),
            /// title subs section
            child: _buildTitleSubsSection(textTheme, context),
          ),

          // 🔹 Like & Comment Buttons
          Positioned(
            bottom: SizeConfig.getHeight(context, 100),
            right: SizeConfig.getWidth(context, 20),
            /// share comment section
            child: _buildShareComSection(context),
          ),

          // 🔹 Comment List
          if (showComments)
            Positioned(
              bottom: SizeConfig.getHeight(context, 150),
              left: SizeConfig.getWidth(context, 20),
              right: SizeConfig.getWidth(context, 80),
              ///comment section
              child: _buildCommentBox(context, textTheme),
            ),

          // 🔹 Comment Input Box with Send Icon
          Positioned(
            bottom: SizeConfig.getHeight(context, 8),
            left: SizeConfig.getWidth(context, 20),
            right: SizeConfig.getWidth(context, 20),

            child: _buildSendComSection(context),
          ),
        ],
      ),
    );
  }

  /// send comment section
  Row _buildSendComSection(BuildContext context) {
    return Row(
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
    );
  }
  ///build comment box
  Container _buildCommentBox(BuildContext context, TextTheme textTheme) {
    return Container(
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
    );
  }
  ///build share comment section
  Column _buildShareComSection(BuildContext context) {
    return Column(
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
    );
  }
  ///build title section
  Column _buildTitleSubsSection(TextTheme textTheme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Live Subtitle or Description",
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: SizeConfig.getHeight(context, 16),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
        SizedBox(height: SizeConfig.getHeight(context, 4),),
        Row(
          children: [
            Column(
              children: [
                CustomCircleAvatar(
                    radius: 25,
                    assetsPath: AssetsPath.logo),
                Text(
                  "Rimu Akter",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            CustomContainer(
                padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2
                ),
                color: AppColors.primary,
                child: Text("Subscribe",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
