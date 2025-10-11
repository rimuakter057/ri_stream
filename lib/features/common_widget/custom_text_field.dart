import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ri_stream/utils/app_sizes.dart';


class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function()?onTap;
final bool ?readOnly;
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false, this.readOnly, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      onTap:onTap ,
      readOnly:readOnly??false ,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: GoogleFonts.inter(
        color: Theme.of(context).textTheme.bodyMedium!.color,
        fontSize: SizeConfig.getFont(context, 16), // responsive font
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: isDark?Colors.grey:Colors.grey,
          fontSize: SizeConfig.getFont(context, 16), // responsive font
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: isDark?Colors.grey:Colors.grey,
          size: SizeConfig.getFont(context, 24), // responsive icon size
        )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
          suffixIcon,
          color: Theme.of(context).iconTheme.color,
          size: SizeConfig.getFont(context, 24), // responsive icon size
        )
            : null,
        filled: true,
        fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)), // responsive border radius
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.getHeight(context, 14),
          horizontal: SizeConfig.getWidth(context, 16),
        ),
      ),
    );
  }
}
