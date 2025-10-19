
import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common/common_widget/custom_profile_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';

import 'package:ri_stream/features/profile/ui/screens/about_user_screen.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                  "Edit",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Edit Your Profile",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(height: SizeConfig.getHeight(context, 8)),

       SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.getWidth(context, 16)),
                      child:       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              CustomProfileImage(
                              icon: Icons.edit,
                              ),
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

                          }, child: Text("Continue"))),
                          SizedBox(height: SizeConfig.getHeight(context, 8)),

                        ],
                      ),
                    ),
                  ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
