import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/auth/ui/screens/success_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                  "Reset Password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Reset Password to continue",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height:SizeConfig.getHeight(context, 64),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///text from field
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

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
                            "Confirmed Password",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(height: SizeConfig.getHeight(context, 8)),
                          const CustomTextField(
                            hintText: "Enter Confirmed Password",
                            obscureText: true,
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: SizeConfig.getHeight(context, 120)),
                    Center(child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const
                        SuccessScreen()), // target screen
                      );
                    }, child: Text("Continue"))),
                    SizedBox(height: SizeConfig.getHeight(context, 18)),

                    Center(child: HaveAccountTextWidget(
                      firstText: "Change your mind? ",

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const
                          SignInScreen()), // target screen
                        );
                      },)),
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



