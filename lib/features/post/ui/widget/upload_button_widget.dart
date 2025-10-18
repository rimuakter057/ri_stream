import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';


class UploadButtonWidget extends StatelessWidget {
  const UploadButtonWidget({
    super.key, required this.text, required this.icon, required this.onTap, this.bgColor,
  });
  final String text;
  final IconData icon;
  final Color?bgColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.getWidth(context, 150),
      height: SizeConfig.getHeight(context, 45),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: Colors.white,
          size: SizeConfig.getFont(context, 18),
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.getFont(context, 14),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:bgColor?? AppColors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.getWidth(context, 12),
            ),
          ),
        ),
      ),
    );
  }
}