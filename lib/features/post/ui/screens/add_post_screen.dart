import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/post/ui/widget/upload_button_widget.dart';

import 'package:ri_stream/utils/app_sizes.dart';


class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text("Add New Post"),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(SizeConfig.getWidth(context, 16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- upload Field ----------
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Post Title",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: SizeConfig.getHeight(context, 8)),
                  const CustomTextField(
                    hintText: "Enter Title",
                  ),
                  SizedBox(height: SizeConfig.getHeight(context, 16)),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: SizeConfig.getHeight(context, 8)),
                   CustomTextField(
                     minLine: 2,
                    maxLine: 3,
                    hintText: "Enter Description",
                   ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 16)),
            /// ---------- Media preview ----------
            Container(
              height: SizeConfig.getHeight(context, 220),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  SizeConfig.getWidth(context, 12),
                ),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Center(
                child: Text(
                  "No media selected\n(Preview area)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeConfig.getFont(context, 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 20)),

            /// ---------- Upload Buttons ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UploadButtonWidget(text: 'Photo', icon: Icons.image, onTap: () {  },),
                UploadButtonWidget(text: 'Video',
                  bgColor: Colors.orange,
                  icon: Icons.video_library, onTap: () {  },),
              ],
            ),
            SizedBox(height: SizeConfig.getHeight(context, 56)),

            /// ---------- Post Button ----------
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Post",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


