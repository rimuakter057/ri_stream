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
  final bool readOnly;
  final FocusNode? focusNode;
  final int? maxLine;
  final int? minLine; // ✅ added minLine support

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.focusNode,
    this.maxLine,
    this.minLine, // optional
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
      minLines: obscureText ? 1 : (minLine ?? 1),         // 🔹 initial height
      maxLines: obscureText ? 1 : (maxLine ?? 5),         // 🔹 auto-grow limit
      style: GoogleFonts.inter(
        color: Theme.of(context).textTheme.bodyMedium?.color,
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
          size: SizeConfig.getFont(context, 22),
        )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
          suffixIcon,
          color: Theme.of(context).iconTheme.color,
          size: SizeConfig.getFont(context, 22),
        )
            : null,
        filled: true,
        fillColor: isDark ? Colors.grey[850] : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 8)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: obscureText
              ? SizeConfig.getHeight(context, 14)
              : SizeConfig.getHeight(context, 8),
          horizontal: SizeConfig.getWidth(context, 16),
        ),
      ),
    );
  }
}
