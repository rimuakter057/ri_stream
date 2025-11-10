

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/main_nav/main_nav_screen.dart';

class SplashService {
  void isLogin(BuildContext context) {
    FirebaseAuth auth =FirebaseAuth.instance;
    User? user= auth.currentUser;
    if(user!=null){
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainBottomNavScreen(),
          ),
        );
      });
    }else{
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      });
    }

  }
}