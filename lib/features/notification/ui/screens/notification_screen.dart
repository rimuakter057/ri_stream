import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_circle_avatar.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Notification"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined))
        ],
      ),
      
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CustomCircleAvatar(assetsPath: AssetsPath.logo),
            title: Text(
              "Rimu Akter \nHey! Are you there? Hey! Are you there? $index",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              "Hey! Are you there? Hey! Are you there? Hey! Are you there?",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: SizeConfig.getFont(context, 12),
                fontWeight: FontWeight.w300,
                color: AppColors.grey,
              ),
            ),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color:isDark? Colors.white12:Colors.grey.shade200,
            thickness: 1,
            height: 16,
          );
        },
      ),
    );
  }
}
