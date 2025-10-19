import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ri_stream/features/main_nav/main_nav_screen.dart';
import 'package:ri_stream/theme/app_theme.dart';

import 'features/home/ui/screens/home_screens.dart';
import 'main.dart';







class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RiStream',
          theme: AppTheme.lightTheme(context),
          darkTheme: AppTheme.darkTheme(context),
          themeMode: currentMode, // 🔹 এখানে theme toggle হবে
          home: const SignInScreen(),
        );
      },
    );
  }
}