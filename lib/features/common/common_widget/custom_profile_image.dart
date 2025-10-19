import 'dart:io';
import 'package:flutter/material.dart';

import 'package:ri_stream/features/common/common_widget/custom_asset_image.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, this.onTap, this.iconPath, this.icon});

  final void Function()? onTap;
  final String? iconPath;
final IconData?icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.getHeight(context, 120),
          width: SizeConfig.getWidth(context, 120),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 2),


          ),
          child: CustomAssetImage(assetsPath: AssetsPath.logo),
        ),


        Positioned(
          bottom: 8,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: IconButton(onPressed: (){},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  shape:CircleBorder(),
                ),
                icon: Icon(icon??Icons.add,color: Colors.white,size: 24,))

          ),
        ),
      ],
    );
  }
}
