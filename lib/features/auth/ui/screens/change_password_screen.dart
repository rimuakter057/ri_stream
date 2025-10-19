import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/auth/ui/screens/success_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/common/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isChecked = false; // ✅ build-এর বাইরে রাখতে হবে

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Text("Change Password"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
             top: SizeConfig.getHeight(context, 16),
              left: SizeConfig.getWidth(context, 16),
              right: SizeConfig.getWidth(context, 16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Old Password",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: SizeConfig.getHeight(context, 8)),
                      const CustomTextField(
                        hintText: "Enter Old Password",
                        obscureText: true,
                      ),

                      SizedBox(height: SizeConfig.getHeight(context, 16)),
                      Text(
                        "New Password",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: SizeConfig.getHeight(context, 8)),
                      const CustomTextField(
                        hintText: "Enter New Password",
                        obscureText: true,
                      ),

                      SizedBox(height: SizeConfig.getHeight(context, 16)),
                      Text(
                        "Confirmed New Password",
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
                }, child: Text("Save"))),
                SizedBox(height: SizeConfig.getHeight(context, 18)),




              ],
            ),
          ),
        ),
      ),
    );
  }
}



