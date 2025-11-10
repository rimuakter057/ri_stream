import 'package:flutter/material.dart';
import 'package:ri_stream/theme/app_theme.dart';
import 'features/practice/database/pages/add_post_page.dart';
import 'features/practice/database/pages/show_post_screen.dart';
import 'features/splash/splash_screen.dart';
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
          home: const ShowPostPage(),
        );
      },
    );
  }
}