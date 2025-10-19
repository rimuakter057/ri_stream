import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';

import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Automatically focus search field when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.black : AppColors.white;
    final textColor = isDark ? AppColors.white : AppColors.black;
    final iconColor = isDark ? AppColors.white : AppColors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: iconColor, size: SizeConfig.getFont(context, 24)),
          onPressed: () => Navigator.pop(context),
        ),

        title: SizedBox(
          height: 42,
          child: CustomTextField(
            focusNode: _focusNode,
            prefixIcon: Icons.search,
            hintText: "Search",),
        ),

      ),













      body: Center(
        child: Text(
          "Search results will appear here",
          style: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 16),
            color: textColor,
          ),
        ),
      ),
    );
  }
}
