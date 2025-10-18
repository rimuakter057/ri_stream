import 'dart:io';
import 'package:flutter/material.dart';

import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, this.onTap, this.iconPath});

  final void Function()? onTap;
  final String? iconPath;

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
                icon: Icon(Icons.add,color: Colors.black,size: 24,))








            // Container(
            //   padding: EdgeInsets.all(8),
            //   height: SizeConfig.getHeight(context, 32),
            //   width: SizeConfig.getWidth(context, 32),
            //   decoration: const BoxDecoration(
            //     color: Colors.tealAccent,
            //     shape: BoxShape.circle,
            //   ),
            //   child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.add))
            //   )
            // ),
          ),
        ),
      ],
    );
  }
}
