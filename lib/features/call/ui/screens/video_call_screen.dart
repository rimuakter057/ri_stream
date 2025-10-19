import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class VideoCallScreen extends StatelessWidget {
  final String remoteUserName;
  final String remoteUserImage;
  final String localUserImage;

  const VideoCallScreen({
    super.key,
    required this.remoteUserName,
    required this.remoteUserImage,
    required this.localUserImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Fullscreen remote user video
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(remoteUserImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Top overlay: remote user name + back arrow
            Positioned(
              top: SizeConfig.getHeight(context, 16),
              left: SizeConfig.getWidth(context, 8),
              right: SizeConfig.getWidth(context, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // Remote user name
                  Text(
                    remoteUserName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(width: 40), // placeholder to balance row
                ],
              ),
            ),

            // Small self-preview (top-right)
            Positioned(
              top: SizeConfig.getHeight(context, 100),
              right: SizeConfig.getWidth(context, 48),
              child: Container(
                width: SizeConfig.getWidth(context, 140),
                height: SizeConfig.getHeight(context, 180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage(localUserImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Bottom controls
            Positioned(
              bottom: SizeConfig.getHeight(context, 40),
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mute mic
                  CircleAvatar(
                    radius: SizeConfig.getHeight(context, 28),
                    backgroundColor: Colors.grey[800],
                    child: IconButton(
                      icon: const Icon(Icons.mic_off, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),

                  // End call
                  CircleAvatar(
                    radius: SizeConfig.getHeight(context, 28),
                    backgroundColor: Colors.red.shade900,
                    child: IconButton(
                      icon: const Icon(Icons.call_end, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // Switch camera
                  CircleAvatar(
                    radius: SizeConfig.getHeight(context, 28),
                    backgroundColor: Colors.grey[800],
                    child: IconButton(
                      icon: const Icon(Icons.cameraswitch, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
