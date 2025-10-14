import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_profile_image.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class AboutUserScreen extends StatefulWidget {
  const AboutUserScreen({super.key});

  @override
  State<AboutUserScreen> createState() => _AboutUserScreenState();
}

class _AboutUserScreenState extends State<AboutUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        title: Text("About Me"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(children: [
            ///profile section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomProfileImage(),
                SizedBox(height: SizeConfig.getHeight(context, 16)),
                Text(
                  "Rimu Akter",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: SizeConfig.getHeight(context, 4)),
                Text(
                  "Rimu Akter subtitle",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.getHeight(context, 16)),
            Row(

              crossAxisAlignment: CrossAxisAlignment.start, // align top
              children: [
                Text(
                  "NAME:",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Rimu Akter ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            )


          ],),
        ),
      ),
    );
  }
}
