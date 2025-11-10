

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM, // Default পজিশন: নিচে
    Color backgroundColor = Colors.black54,
    Color textColor = Colors.white,
    int duration = 2, // iOS/Web এর জন্য সেকেন্ড
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // LENGTH_SHORT সাধারণত 2 সেকেন্ডের কাছাকাছি
      gravity: gravity,
      timeInSecForIosWeb: duration,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  static void showSuccessToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.red.shade900,
    );
  }

  static void showErrorToast(String message) {
    showToast(

      message: message,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM, // Error Message উপরে দেখানো যেতে পারে
    );
  }
}