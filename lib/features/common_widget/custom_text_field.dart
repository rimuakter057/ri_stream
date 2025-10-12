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
  final VoidCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode; // ✅ optional focus node

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly,
    this.onTap,
    this.focusNode, // ✅ added
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      focusNode: focusNode, // ✅ use it here
      onTap: onTap,
      readOnly: readOnly ?? false,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: GoogleFonts.inter(
        color: Theme.of(context).textTheme.bodyMedium!.color,
        fontSize: SizeConfig.getFont(context, 16),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: Colors.grey,
          fontSize: SizeConfig.getFont(context, 16),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: Colors.grey,
          size: SizeConfig.getFont(context, 24),
        )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
          suffixIcon,
          color: Theme.of(context).iconTheme.color,
          size: SizeConfig.getFont(context, 24),
        )
            : null,
        filled: true,
        fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(SizeConfig.getWidth(context, 8)),
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
