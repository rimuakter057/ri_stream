import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/forget_password_screen.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/main_nav/main_nav_screen.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false; // ✅ build-এর বাইরে রাখতে হবে

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.getHeight(context, 64),
              left: SizeConfig.getWidth(context, 16),
              right: SizeConfig.getWidth(context, 16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///sign in header text
                Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Sign in to continue",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(height: SizeConfig.getHeight(context, 24)),

                Card(
                  color: isDark ? Colors.white12 : Colors.teal,
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.getWidth(context, 16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///text from field
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Enter Email",
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 16)),
                                Text(
                                  "Password",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Enter Password",
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(context, 16)),
                          ///remember and forget password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ✅ Left side
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.scale(
                                    scale: 0.9, // ✅ ছোট Checkbox
                                    child: Checkbox(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          isChecked = val!;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      side: const BorderSide(color: Colors.tealAccent, width: 2), // ✅ border tealAccent
                                      checkColor: Colors.black, // ✅ tick color
                                      fillColor: WidgetStateProperty.resolveWith(
                                            (states) {
                                          if (states.contains(WidgetState.selected)) {
                                            return Colors.tealAccent; // ✅ সবসময় tealAccent
                                          }
                                          return Colors.transparent; // unchecked হলে transparent
                                        },
                                      ),
                                    ),
                                  ),
          
          
                                  Text(
                                    "Remember me",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
          
                              // ✅ Right side
                              TextButton(
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()), // target screen
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Forget Password?",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.tealAccent ,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.getHeight(context, 18)),
                      Center(child: ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const
                          MainBottomNavScreen()), // target screen
                        );
                      }, child: Text("Sign In"))),
                          SizedBox(height: SizeConfig.getHeight(context, 18)),

                          Center(child: HaveAccountTextWidget(
                            firstText: "Don't have any account? ",
                            lastText: "Sign Up",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const
                                SignUpScreen()), // target screen
                              );


                            },)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getHeight(context, 24)),
                CustomDividerOr(),
                SizedBox(height: SizeConfig.getHeight(context, 32)),


                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24), // ✅ radius 24
                      ),
                      color: isDark ? Colors.white12 : Colors.teal,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16), // ✅ increased vertical padding
                        child: Row(
                          children: [
                            ClipOval(
                              child: CustomAssetImage(
                                assetsPath: AssetsPath.googleIcon,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Continue with Google",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.getHeight(context, 8)),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: isDark ? Colors.white12 : Colors.teal,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            ClipOval(
                              child: CustomAssetImage(
                                assetsPath: AssetsPath.facebookIcon,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Continue with Facebook",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.getHeight(context, 8)),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: isDark ? Colors.white12 : Colors.teal,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            ClipOval(
                              child: CustomAssetImage(
                                assetsPath: AssetsPath.appleIcon,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Continue with Apple",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: SizeConfig.getHeight(context, 16)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



