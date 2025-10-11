import 'package:flutter/material.dart';

class SizeConfig {
  // স্ক্রিনের width অনুযায়ী scale factor নির্ধারণ
  static double scaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 600) {
      // Tablet
      return 1.5;
    } else if (width >= 480) {
      // বড় মোবাইল
      return 1.2;
    } else {
      // ছোট মোবাইল
      return 1.0;
    }
  }

  // font size responsive করা
  static double getFont(BuildContext context, double size) {
    return size * scaleFactor(context);
  }

  // padding responsive করা
  static double getPadding(BuildContext context, double padding) {
    return padding * scaleFactor(context);
  }

  // height responsive করা
  static double getHeight(BuildContext context, double height) {
    return height * scaleFactor(context);
  }

  // width responsive করা
  static double getWidth(BuildContext context, double width) {
    return width * scaleFactor(context);
  }
}
