import 'package:flutter/material.dart';
import 'package:ri_stream/features/call/ui/screens/adio_call_screen.dart';
import 'package:ri_stream/features/call/ui/screens/video_call_screen.dart';
import 'package:ri_stream/features/message/ui/widgets/chat_input_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class ChatScreen extends StatefulWidget {
  final String chatWith; // Name of the other user

  const ChatScreen({super.key, required this.chatWith});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi there!', 'isMe': false},
    {'text': 'Hello! How are you?', 'isMe': true},
    {'text': 'I am good, thanks!', 'isMe': false},
  ];

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add({'text': text, 'isMe': true});
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide default back button
        titleSpacing: 0,
        title: Row(
          children: [
            // Back arrow
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: isDark ? Colors.white : Colors.black),
              onPressed: () => Navigator.pop(context),
            ),

            // Profile Image
            CircleAvatar(
              radius: SizeConfig.getHeight(context, 20),
              backgroundImage: AssetImage('assets/images/profile1.jpg'), // replace with dynamic profile
            ),
            SizedBox(width: SizeConfig.getWidth(context, 8)),

            // Profile Name
            Expanded(
              child: Text(
                widget.chatWith,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.getHeight(context, 16),
                  color: isDark ? Colors.white : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Audio Call
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AudioCallScreen(userName: "Riyad", profileImage: "assets/icons/logo.png")), // target screen
                );
              },
              icon: Icon(Icons.call, color: isDark ? Colors.white : Colors.black),
            ),

            // Video Call
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VideoCallScreen(remoteUserName: 'P', remoteUserImage: 'Q', localUserImage: 'R',)), // target screen
                );
              },
              icon: Icon(Icons.videocam, color: isDark ? Colors.white : Colors.black),
            ),
          ],
        ),
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 1,
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Chat messages
            Expanded(
              child: ListView.builder(
                reverse: true, // latest message at bottom
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(context, 16), vertical: SizeConfig.getHeight(context, 8)),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[messages.length - 1 - index];
                  return Align(
                    alignment: msg['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getHeight(context, 8),
                        horizontal: SizeConfig.getWidth(context, 12),
                      ),
                      margin: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(context, 4)),
                      constraints: BoxConstraints(
                        maxWidth: SizeConfig.getWidth(context, 250),
                      ),
                      decoration: BoxDecoration(
                        color: msg['isMe']
                            ? theme.colorScheme.primary.withOpacity(0.8)
                            : (isDark ? Colors.grey[800] : Colors.grey[300]),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: msg['isMe'] ? const Radius.circular(12) : const Radius.circular(0),
                          bottomRight: msg['isMe'] ? const Radius.circular(0) : const Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        msg['text'],
                        style: TextStyle(
                          color: msg['isMe'] ? Colors.white : isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Input field + send button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ChatInputField(
                controller: _controller,
                onSend: sendMessage,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
