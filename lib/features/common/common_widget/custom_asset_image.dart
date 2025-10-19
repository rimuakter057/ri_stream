import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';


class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage({
    super.key, required this.assetsPath, this.height, this.width,
  });

  final String assetsPath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetsPath,
      height:height??SizeConfig.getHeight(context, 24),
      width:width?? SizeConfig.getWidth(context, 24),
    );
  }
}
