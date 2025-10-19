import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_data/post_model_item.dart';
import 'package:ri_stream/features/common/common_widget/custom_circle_avatar.dart' show CustomCircleAvatar;
import 'package:ri_stream/features/common/common_widget/custom_container.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/video/common/widget/like_com_share_widget.dart';
import 'package:ri_stream/features/video/common/widget/post_title_pro_widget.dart';

import 'package:ri_stream/features/video/live/data/comment_list.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';



class ShortVideoScreen extends StatefulWidget {
  const ShortVideoScreen({super.key});

  @override
  State<ShortVideoScreen> createState() => _ShortVideoScreenState();
}

class _ShortVideoScreenState extends State<ShortVideoScreen> {
  bool showComments = false;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: demoPostList.length,
        itemBuilder: (context, index) {
          final post = demoPostList[index];

          return Stack(
            children: [
              /// 🔹 Background Image
              Positioned.fill(
                child: Image.asset(
                  post.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),


              /// 🔹 Title, Subtitle & Profile
              Positioned(
                bottom: SizeConfig.getHeight(context, 60),
                left: SizeConfig.getWidth(context, 20),
                right: SizeConfig.getWidth(context, 80),
                child: PostTitleProSubWidget(
                  textTheme: textTheme,
                  title: post.title,
                  subtitle: post.subtitle,
                  userName: post.userName,
                  userImage: post.userImage,
                ),
              ),


              /// 🔹 Like / Comment / Share Buttons
              Positioned(
                  bottom: SizeConfig.getHeight(context, 100),
                  right: SizeConfig.getWidth(context, 20),
                  child: CommentShareWidget(likes: post.likes, comments: post.comments, views: post.views,
                  onCommentTap: (){
                    setState(() {
                      showComments = !showComments;
                    });
                  },
                  )








                // Column(
                //   children: [
                //     Column(
                //       children: [
                //         Icon(Icons.favorite, color: Colors.red, size: 32),
                //         Text(
                //           "${post.likes}",
                //           style: const TextStyle(
                //             color: Colors.white,
                //             fontSize: 12,
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: 10),
                //     GestureDetector(
                //       onTap: () => setState(() => showComments = !showComments),
                //       child: Column(
                //         children: [
                //           Icon(Icons.comment, color: Colors.white, size: 30),
                //           Text(
                //             "${post.comments}",
                //             style: const TextStyle(
                //               color: Colors.white,
                //               fontSize: 12,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Column(
                //       children: [
                //         Icon(
                //           Icons.remove_red_eye,
                //           color: Colors.white,
                //           size: 28,
                //         ),
                //         Text(
                //           "${post.views}",
                //           style: const TextStyle(
                //             color: Colors.white,
                //             fontSize: 12,
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: 10),
                //     Icon(Icons.share, color: Colors.white, size: 30),
                //   ],
                // ),
              ),

              /// 🔹 Comment Box (Scrollable)
              if (showComments)
                Positioned(
                  bottom: SizeConfig.getHeight(context, 150),
                  left: SizeConfig.getWidth(context, 20),
                  right: SizeConfig.getWidth(context, 80),
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.getHeight(context, 10)),
                    height: SizeConfig.getHeight(context, 200), // fixed height
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius:
                      BorderRadius.circular(SizeConfig.getHeight(context, 10)),
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.getHeight(context, 4)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(comments[i],
                                  style: textTheme.bodyMedium!
                                      .copyWith(color: Colors.white)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

              /// 🔹 Comment Input Field
              Positioned(
                bottom: SizeConfig.getHeight(context, 8),
                left: SizeConfig.getWidth(context, 20),
                right: SizeConfig.getWidth(context, 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: commentController,
                        hintText: "Write a comment...",
                      ),
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
                      child: Icon(Icons.send,
                          color: Colors.red.shade900,
                          size: SizeConfig.getHeight(context, 32)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
