
import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_profile_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  "Sign Up",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Sign Up to continue",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(height: SizeConfig.getHeight(context, 16)),
                ///text field card
                Card(

                  color: isDark ? Colors.white12 : Colors.red.shade50,
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.getWidth(context, 16)),
                      child:       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              CustomProfileImage(),
                              SizedBox(height: SizeConfig.getHeight(context, 16),),
                            ],
                          )),

                          ///text from field
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Enter Full Name",
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 16)),
                                Text(
                                  "User Name",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Enter User Name",
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 16)),
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
                                  "Date of Birth",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Day/Month/Year",
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 16)),
                                Text(
                                  "Gender",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Enter Gender",
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
                                SizedBox(height: SizeConfig.getHeight(context, 16)),



                                Text(
                                  "Location",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: SizeConfig.getHeight(context, 8)),
                                const CustomTextField(
                                  hintText: "Enter Location",
                                  obscureText: true,
                                ),

                                SizedBox(height: SizeConfig.getHeight(context, 16)),



                                Text(
                                  "Social Link (optional)",
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

                          SizedBox(height: SizeConfig.getHeight(context, 32)),
                          Center(child: ElevatedButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignInScreen()), // target screen
                            );

                          }, child: Text("Sign Up"))),
                          SizedBox(height: SizeConfig.getHeight(context, 8)),

                          Center(child: HaveAccountTextWidget(

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SignInScreen()), // target screen
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

                   /// other continue option
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    LoginOptionWidget(assetIcon: AssetsPath.googleIcon, text:    "Continue with Google", onTap: (){},),
                    SizedBox(height: SizeConfig.getHeight(context, 8)),
                    LoginOptionWidget(assetIcon: AssetsPath.facebookIcon, text:    "Continue with Facebook", onTap: (){},),
                    SizedBox(height: SizeConfig.getHeight(context, 8)),
                    LoginOptionWidget(assetIcon: AssetsPath.appleIcon, text:    "Continue with Apple", onTap: (){},)

                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
































//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
// import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
// import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
// import 'package:ri_stream/features/common_widget/custom_profile_image.dart';
// import 'package:ri_stream/features/common_widget/custom_text_field.dart';
// import 'package:ri_stream/utils/app_sizes.dart';
// import 'package:ri_stream/utils/assets_path.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   bool isChecked = false; // ✅ build-এর বাইরে রাখতে হবে
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(
//               top: SizeConfig.getHeight(context, 64),
//               left: SizeConfig.getWidth(context, 16),
//               right: SizeConfig.getWidth(context, 16),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ///sign in header text
//                 Text(
//                   "Sign Up",
//                   style: Theme.of(context).textTheme.headlineLarge,
//                 ),
//                 Text(
//                   "Sign Up to continue",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium!
//                       .copyWith(color: Colors.grey),
//                 ),
//                 SizedBox(height: SizeConfig.getHeight(context, 24)),
//                 ///text field card
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     Center(child: CustomProfileImage()),
//
//                     ///text from field
//                     Form(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Name",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 8)),
//                           const CustomTextField(
//                             hintText: "Enter Full Name",
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 16)),
//                           Text(
//                             "User Name",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 8)),
//                           const CustomTextField(
//                             hintText: "Enter User Name",
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 16)),
//                           Text(
//                             "Email",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 8)),
//                           const CustomTextField(
//                             hintText: "Enter Email",
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 16)),
//                           Text(
//                             "Date of Birth",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 8)),
//                           const CustomTextField(
//                             hintText: "Day/Month/Year",
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 16)),
//                           Text(
//                             "Gender",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 8)),
//                           const CustomTextField(
//                             hintText: "Enter Gender",
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 16)),
//
//
//
//                           Text(
//                             "Password",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           SizedBox(height: SizeConfig.getHeight(context, 8)),
//                           const CustomTextField(
//                             hintText: "Enter Password",
//                             obscureText: true,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: SizeConfig.getHeight(context, 16)),
//                     ///remember and forget password
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // ✅ Left side
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Transform.scale(
//                               scale: 0.9, // ✅ ছোট Checkbox
//                               child: Checkbox(
//                                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                 value: isChecked,
//                                 onChanged: (val) {
//                                   setState(() {
//                                     isChecked = val!;
//                                   });
//                                 },
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                                 side: const BorderSide(color: Colors.tealAccent, width: 2), // ✅ border tealAccent
//                                 checkColor: Colors.black, // ✅ tick color
//                                 fillColor: WidgetStateProperty.resolveWith(
//                                       (states) {
//                                     if (states.contains(WidgetState.selected)) {
//                                       return Colors.tealAccent; // ✅ সবসময় tealAccent
//                                     }
//                                     return Colors.transparent; // unchecked হলে transparent
//                                   },
//                                 ),
//                               ),
//                             ),
//
//
//                             Text(
//                               "Remember me",
//                               overflow: TextOverflow.ellipsis,
//                               style: Theme.of(context).textTheme.bodySmall,
//                             ),
//                           ],
//                         ),
//
//                         // ✅ Right side
//                         TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             minimumSize: Size(0, 0),
//                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           ),
//                           child: Text(
//                             "Forget Password?",
//                             style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                               color: Colors.tealAccent ,
//                               fontWeight: FontWeight.w600,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: SizeConfig.getHeight(context, 18)),
//                     Center(child: ElevatedButton(onPressed: (){}, child: Text("Sign Up"))),
//                     SizedBox(height: SizeConfig.getHeight(context, 18)),
//
//                     Center(child: HaveAccountTextWidget(
//
//                       onTap: () {  },)),
//                   ],
//                 ),
//                 SizedBox(height: SizeConfig.getHeight(context, 24)),
//                 CustomDividerOr(),
//                 SizedBox(height: SizeConfig.getHeight(context, 32)),
//
//
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24), // ✅ radius 24
//                       ),
//                       color: isDark ? Colors.white12 : Colors.teal,
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16), // ✅ increased vertical padding
//                         child: Row(
//                           children: [
//                             ClipOval(
//                               child: CustomAssetImage(
//                                 assetsPath: AssetsPath.googleIcon,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Text(
//                               "Continue with Google",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: SizeConfig.getHeight(context, 8)),
//
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       color: isDark ? Colors.white12 : Colors.teal,
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                         child: Row(
//                           children: [
//                             ClipOval(
//                               child: CustomAssetImage(
//                                 assetsPath: AssetsPath.facebookIcon,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Text(
//                               "Continue with Facebook",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: SizeConfig.getHeight(context, 8)),
//
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       color: isDark ? Colors.white12 : Colors.teal,
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                         child: Row(
//                           children: [
//                             ClipOval(
//                               child: CustomAssetImage(
//                                 assetsPath: AssetsPath.appleIcon,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Text(
//                               "Continue with Apple",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 )
//
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
