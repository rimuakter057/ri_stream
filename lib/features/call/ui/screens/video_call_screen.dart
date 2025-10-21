import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  final String remoteUserName;
  final String remoteUserImage;
  final String localUserName;
  final String localUserImage;

  const VideoCallScreen({
    super.key,
    required this.remoteUserName,
    required this.remoteUserImage,
    required this.localUserName,
    required this.localUserImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double buttonRadius = 20; // Uniform border radius
    const double buttonPadding = 16; // Uniform padding

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              /// Top half: Remote user
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          remoteUserImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Top overlay: back button + remote name
                    Positioned(
                      top: 8,
                      left: 8,
                      right: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black45,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Text(
                            remoteUserName,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black12,thickness: 0.5,),
              /// Bottom half: Local user
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          localUserImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Local user name overlay
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Text(
                        localUserName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    /// Bottom controls
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Mute
                          Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(buttonRadius),
                            ),
                            padding: const EdgeInsets.all(buttonPadding),
                            child: const Icon(Icons.mic_off, color: Colors.white, size: 28),
                          ),

                          // End Call
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade900,
                              borderRadius: BorderRadius.circular(buttonRadius),
                            ),
                            padding: const EdgeInsets.all(buttonPadding),
                            child: const Icon(Icons.call_end, color: Colors.white, size: 28),
                          ),

                          // Switch Camera
                          Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(buttonRadius),
                            ),
                            padding: const EdgeInsets.all(buttonPadding),
                            child: const Icon(Icons.cameraswitch, color: Colors.white, size: 28),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
