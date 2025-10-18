import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';


class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key, required this.assetsPath, this.radius,
  });

  final String assetsPath;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: SizeConfig.getWidth(context,radius?? 32),
      backgroundImage: AssetImage(assetsPath),
    );
  }
}
