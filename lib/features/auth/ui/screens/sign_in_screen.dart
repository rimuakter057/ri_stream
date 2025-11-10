import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/forget_password_screen.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/main_nav/main_nav_screen.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';
import 'package:ri_stream/utils/toast_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    _auth
        .signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
        )
        .then((value) {
          ToastUtils.showSuccessToast("Sign In Success");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MainBottomNavScreen(),
            ), // target screen
          );
        })
        .onError((error, stackTrace) {
          debugPrint(
            "error=======================================${error.toString()}",
          );
          ToastUtils.showErrorToast(error.toString());
        });}

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
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                ),
                SizedBox(height: SizeConfig.getHeight(context, 24)),

                Card(
                  shadowColor: Colors.grey,
                  color: isDark ? Colors.white12 : Colors.red.shade50,
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.getWidth(context, 16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///text from field
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  height: SizeConfig.getHeight(context, 8),
                                ),
                                CustomTextField(
                                  controller: emailController,
                                  hintText: "Enter Email",
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "Email cannot be empty.";
                                    }
                                    final emailRegex = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                    );
                                    if (!emailRegex.hasMatch(value)) {
                                      return "Please enter a valid email address.";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: SizeConfig.getHeight(context, 16),
                                ),
                                Text(
                                  "Password",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  height: SizeConfig.getHeight(context, 8),
                                ),
                                CustomTextField(
                                  controller: passwordController,
                                  hintText: "Enter Password",
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required.';
                                    }
                                    if (value.length < 8) {
                                      return 'Password must be at least 8 characters long.';
                                    }
                                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                      return 'Must contain at least one uppercase letter.';
                                    }
                                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                                      return 'Must contain at least one lowercase letter.';
                                    }
                                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                                      return 'Must contain at least one digit.';
                                    }
                                    return null;
                                  },
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
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          isChecked = val!;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      side: BorderSide(
                                        color: Colors.red.shade900,
                                        width: 2,
                                      ), // ✅ border tealAccent
                                      checkColor: Colors.black, // ✅ tick color
                                      fillColor: WidgetStateProperty.resolveWith((
                                        states,
                                      ) {
                                        if (states.contains(
                                          WidgetState.selected,
                                        )) {
                                          return Colors
                                              .red
                                              .shade900; // ✅ সবসময় tealAccent
                                        }
                                        return Colors
                                            .transparent; // unchecked হলে transparent
                                      }),
                                    ),
                                  ),

                                  Text(
                                    "Remember me",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),

                              // ✅ Right side
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const ForgotPasswordScreen(),
                                    ), // target screen
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.getHeight(context, 18)),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  login();
                                }
                              },
                              child: Text("Sign In"),
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(context, 18)),
                          Center(
                            child: HaveAccountTextWidget(
                              firstText: "Don't have any account? ",
                              lastText: "Sign Up",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpScreen(),
                                  ), // target screen
                                );
                              },
                            ),
                          ),
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
                    LoginOptionWidget(
                      assetIcon: AssetsPath.googleIcon,
                      text: "Continue with Google",
                      onTap: () {},
                    ),
                    SizedBox(height: SizeConfig.getHeight(context, 8)),
                    LoginOptionWidget(
                      assetIcon: AssetsPath.facebookIcon,
                      text: "Continue with Facebook",
                      onTap: () {},
                    ),
                    SizedBox(height: SizeConfig.getHeight(context, 8)),
                    LoginOptionWidget(
                      assetIcon: AssetsPath.appleIcon,
                      text: "Continue with Apple",
                      onTap: () {},
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

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({
    super.key,
    required this.assetIcon,
    required this.text,
    required this.onTap,
  });

  final String assetIcon;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // ✅ radius 24
        ),
        color: isDark ? Colors.white12 : Colors.red.shade50,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ), // ✅ increased vertical padding
          child: Row(
            children: [
              ClipOval(child: CustomAssetImage(assetsPath: assetIcon)),
              const SizedBox(width: 10),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
