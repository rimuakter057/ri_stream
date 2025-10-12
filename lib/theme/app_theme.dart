import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ri_stream/utils/app_colors.dart';

import '../utils/app_sizes.dart';


class AppTheme {
  // Light Theme
  static ThemeData lightTheme(BuildContext context) {
    final scale = SizeConfig.scaleFactor(context);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: AppColors.white,

      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        titleTextStyle: GoogleFonts.inter(
          fontSize: SizeConfig.getFont(context, 24),
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
          size: SizeConfig.getFont(context, 28),
        ),
      ),




        textTheme : TextTheme(
          headlineLarge: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 32),
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),

          headlineMedium: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 28),
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),


          headlineSmall: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 18),
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),


          bodyLarge: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 24),
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 16),
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: SizeConfig.getFont(context, 14),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            250, // ✅ width
            SizeConfig.getHeight(context, 52), // ✅ height
          ),
          backgroundColor:Colors.tealAccent ,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getPadding(context, 20),
            vertical: SizeConfig.getPadding(context, 12),
          ),
          textStyle: GoogleFonts.inter(
            letterSpacing: 0.5,
            fontSize: SizeConfig.getFont(context, 24),
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),




      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getPadding(context, 16),
          vertical: SizeConfig.getPadding(context, 12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)),
          borderSide: BorderSide.none,
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(SizeConfig.getWidth(context, 16)),
          ),
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme(BuildContext context) {
    final scale = SizeConfig.scaleFactor(context);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,

      ///appbar
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.black,
        elevation: 2,
        titleTextStyle: GoogleFonts.inter(
          fontSize: SizeConfig.getFont(context, 24),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: SizeConfig.getFont(context, 28),
        ),
      ),

    /// text theme
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(
          fontSize: SizeConfig.getFont(context, 32),
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),

        headlineMedium: GoogleFonts.poppins(
          fontSize: SizeConfig.getFont(context, 28),
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),


        headlineSmall: GoogleFonts.poppins(
          fontSize: SizeConfig.getFont(context, 24),
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),


        bodyMedium: GoogleFonts.inter(
          fontSize: SizeConfig.getFont(context, 16),
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: SizeConfig.getFont(context, 14),
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: SizeConfig.getFont(context, 20),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            250, // ✅ width
            SizeConfig.getHeight(context, 52), // ✅ height
          ),
          backgroundColor:Colors.white12 ,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getPadding(context, 20),
            vertical: SizeConfig.getPadding(context, 12),
          ),
          textStyle: GoogleFonts.inter(
            letterSpacing: 0.5,
            fontSize: SizeConfig.getFont(context, 24),
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),


      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getPadding(context, 16),
          vertical: SizeConfig.getPadding(context, 12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(context, 12)),
          borderSide: BorderSide.none,
        ),
      ),




      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(SizeConfig.getWidth(context, 16)),
          ),
        ),
      ),
    );
  }
}
