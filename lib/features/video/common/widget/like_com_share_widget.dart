import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/share_bottom_shee_widget.dart';

import 'package:ri_stream/utils/app_sizes.dart';

class CommentShareWidget extends StatelessWidget {
  final int likes;
  final int comments;
  final int views;
  final VoidCallback? onCommentTap;


   const CommentShareWidget({
    super.key,
    required this.likes,
    required this.comments,
    required this.views, this.onCommentTap,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildIconText(Icons.favorite, likes.toString(), color: Colors.red, size: 32),
        SizedBox(height: SizeConfig.getHeight(context, 10)),
        GestureDetector(
          onTap: onCommentTap,
          child: _buildIconText(Icons.comment, comments.toString(), color: Colors.white, size: 30),
        ),
        SizedBox(height: SizeConfig.getHeight(context, 10)),
        _buildIconText(Icons.remove_red_eye, views.toString(), color: Colors.white, size: 28),
        SizedBox(height: SizeConfig.getHeight(context, 10)),
        GestureDetector(
          onTap: () {
            // Bottom sheet open
            showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) => const ShareBottomSheet(), // আলাদা UI ফাইল থেকে import
            );
          },
          child: Icon(Icons.share, color: Colors.white, size: 30),
        )

      ],
    );
  }

  Column _buildIconText(IconData icon, String text, {Color color = Colors.white, double size = 24}) {
    return Column(
      children: [
        Icon(icon, color: color, size: size),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
