import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/reset_password_screen.dart';
import 'package:ri_stream/features/auth/ui/widgets/custom_divider_or.dart';
import 'package:ri_stream/features/auth/ui/widgets/have_account_text_widget.dart';
import 'package:ri_stream/features/auth/ui/widgets/pin_field_widget.dart';
import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController pinController = TextEditingController();
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
                      ""
                          "Enter verification Code",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      "Enter verification Code to continue",
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

                      /// Pin Field
                      PinFieldWidget(
                        controller: pinController,
                        //  controller: controller.pinController,
                        length: 5,
                        // onChanged: controller.onPinChanged,
                        onCompleted: (val) => debugPrint("Completed: $val"),
                      ),



                    ],
                  ),
                ),

                SizedBox(
                  height:SizeConfig.getHeight(context, 120),
                ),

                Center(child: ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const
                    ResetPasswordScreen()), // target screen
                  );
                }, child: Text("Continue"))),
                SizedBox(height: SizeConfig.getHeight(context, 18)),
                Center(child: HaveAccountTextWidget(
                  firstText: "Haven't receive any code? ",
                  lastText: "Resend Code",
                  onTap: () {  },)),



              ],
            ),
          ),
        ),
      ),
    );
  }
}



