import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class AudioCallScreen extends StatelessWidget {
  final String userName;
  final String profileImage;

  const AudioCallScreen({
    super.key,
    required this.userName,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Back arrow (top-left)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.getHeight(context, 8)),
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),

            SizedBox(height: SizeConfig.getHeight(context, 40)),

            // Profile Image
            CircleAvatar(
              radius: SizeConfig.getHeight(context, 60),
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 16)),

            // User Name
            Text(
              userName,
              style: TextStyle(
                fontSize: SizeConfig.getHeight(context, 22),
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 8)),

            // Calling Text
            Text(
              "Calling...",
              style: TextStyle(
                fontSize: SizeConfig.getHeight(context, 16),
                color: isDark ? Colors.white70 : Colors.grey[700],
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 80)),

            // Call Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mute
                CircleAvatar(
                  radius: SizeConfig.getHeight(context, 28),
                  backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                  child: IconButton(
                    icon: Icon(Icons.mic_off, color: isDark ? Colors.white : Colors.black),
                    onPressed: () {},
                  ),
                ),
                // End Call
                CircleAvatar(
                  radius: SizeConfig.getHeight(context, 28),
                  backgroundColor: Colors.red.shade900,
                  child: IconButton(
                    icon: const Icon(Icons.call_end, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Speaker
                CircleAvatar(
                  radius: SizeConfig.getHeight(context, 28),
                  backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                  child: IconButton(
                    icon: Icon(Icons.volume_up, color: isDark ? Colors.white : Colors.black),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
