import 'package:flutter/material.dart';

import 'package:ri_stream/features/notification/ui/widgets/notification_list_tile_widget.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
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
          return  NotificationTile(userName: 'Rimu Akter', message: 'are you well??', time: DateTime.now(),);


        },
        separatorBuilder: (context, index) {
          return Divider(
            color:isDark? Colors.white12:Colors.grey.shade200,
            thickness: 1,
            height: SizeConfig.getHeight(context, 2)
          );
        },
      ),
    );
  }
}
