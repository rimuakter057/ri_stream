import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart'; // for SizeConfig

class CircularIconCircleWidget extends StatelessWidget {
  final IconData icon;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Color?iconColor;

  const CircularIconCircleWidget({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.onTap, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: height ?? SizeConfig.getHeight(context, 50),
      width: width ?? SizeConfig.getWidth(context, 50),
      child: IconButton(
        onPressed: onTap ?? () {},
        icon: Icon(
          icon,
          size: 32,
          color:iconColor?? Colors.white,
        ),
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: isDark ? Colors.grey[900] : Colors.teal,
          elevation: 4,
          shadowColor: Colors.white12,
        ),
      ),
    );
  }
}
