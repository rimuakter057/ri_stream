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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: SizeConfig.getHeight(context, 60),
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 16)),

            // User Name
            Text(
              userName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.getHeight(context, 22),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 8)),

            // Calling Text
            Text(
              "Calling...",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: SizeConfig.getHeight(context, 16),
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
                  backgroundColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[300],
                  child: IconButton(
                    icon: const Icon(Icons.mic_off),
                    onPressed: () {},
                  ),
                ),
                // End Call
                CircleAvatar(
                  radius: SizeConfig.getHeight(context, 28),
                  backgroundColor: Colors.red.shade900,
                  child: IconButton(
                    icon: const Icon(Icons.call_end,color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Speaker
                CircleAvatar(
                  radius: SizeConfig.getHeight(context, 28),
                  backgroundColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[300],
                  child: IconButton(
                    icon: const Icon(Icons.volume_up),
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
