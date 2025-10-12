

import 'package:flutter/material.dart';
import 'package:ri_stream/features/common_widget/custom_asset_image.dart';
import 'package:ri_stream/features/common_widget/custom_circle_avatar.dart';
import 'package:ri_stream/features/common_widget/custom_text_field.dart';
import 'package:ri_stream/features/notification/ui/screens/notification_screen.dart';
import 'package:ri_stream/features/search/ui/screens/search_screen.dart';
import 'package:ri_stream/utils/app_colors.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/utils/assets_path.dart';
import 'package:badges/badges.dart' as badges;




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


     appBar:    AppBar(
        leading: CustomAssetImage(assetsPath: AssetsPath.logo),
    title: const Text("RiStream"),
    actions: [

      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            showBadge: true,
            badgeContent: const Text(
            '3', // unread count
            style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.tealAccent, // badge color
            padding: EdgeInsets.all(6),
            ),
            child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()), // target screen
              );
            },
            icon: const Icon(Icons.notifications_outlined, size: 28),
            ),
            ),
      ),
    ],
    ),


    ///body section

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: SizeConfig.getHeight(context, 16,),
          left: SizeConfig.getWidth(context, 16),
            right:SizeConfig.getWidth(context, 16),
          ),
          child: Column(children: [
            ///search bar
            CustomTextField(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()), // target screen
                );

              },
              readOnly: true,
              prefixIcon: Icons.search,
              hintText: "Search",
            ),
           SizedBox(
             height:SizeConfig.getHeight(context, 24,),
           ),

            /// horizontally profile pic
            SizedBox(
              height:SizeConfig.getHeight(context, 120,), // height নির্ধারণ করতে হবে
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: SizeConfig.getWidth(context, 80),
                    child: Column(children: [
                      CustomCircleAvatar(assetsPath: AssetsPath.logo,),
                      Text( "Rimu Akter",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        style:Theme.of(context).textTheme.bodyMedium,
                         ),


                    ],),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: SizeConfig.getWidth(context, 8),

                  );
              },
              ),
            ),


            /// vertically profile pic
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // scroll conflict avoid
              shrinkWrap: true, // SingleChildScrollView এর ভিতরে use করতে হবে
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CustomCircleAvatar(assetsPath: AssetsPath.logo),
                  title: Text(
                    "Rimu Akter $index",
                    style: Theme.of(context).textTheme.bodyMedium, // Title: w600
                  ),
                  subtitle: Text(

                    maxLines:1,

                    "Hey! Are you there?Hey! Are you there?Hey! Are you there?Hey! Are you there?Hey! Are you there?", // Subtitle message preview
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: SizeConfig.getFont(context, 12),
                      fontWeight: FontWeight.w300,
                      color: AppColors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, // Important! না হলে পুরো row spread হবে
                    children: [
                      Text(
                        "2:45 PM", // message time
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: SizeConfig.getFont(context, 10),
                          fontWeight: FontWeight.w300,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(width: SizeConfig.getWidth(context, 4)),
                      Icon(
                        Icons.check, // delivery status
                        size: SizeConfig.getFont(context, 14),
                        color: Colors.blue, // delivered/read color
                      ),
                    ],
                  ),
                );


              },
            ),


          ],
          ),
        ),
      ),

    );
  }
}


