import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ri_stream/theme/app_theme.dart';

import 'features/auth/ui/screens/sign_in_screen.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Theme Demo',


      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
     themeMode: ThemeMode.dark,

      home: SignInScreen(),
    );
  }
}