import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot password",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      "Forgot Password to continue",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),

                   SizedBox(
                     height:SizeConfig.getHeight(context, 64),
                   ),
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

                        ],
                      ),
                    ),

              SizedBox(
                height:SizeConfig.getHeight(context, 120),
              ),

                Center(child: ElevatedButton(onPressed: (){}, child: Text("Continue"))),





              ],
            ),
          ),
        ),
      ),
    );
  }
}



