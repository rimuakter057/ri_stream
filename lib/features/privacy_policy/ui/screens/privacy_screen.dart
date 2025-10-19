import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool isPrivateAccount = true;
  bool allowMessages = true;
  bool showActivityStatus = false;
  bool allowTags = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Privacy Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(SizeConfig.getHeight(context, 16)),
          children: [
            Text(
              "Account Privacy",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 8)),
            SwitchListTile(
              title: const Text("Private Account"),
              subtitle: const Text("Only approved followers can see your posts"),
              value: isPrivateAccount,
              onChanged: (val) {
                setState(() {
                  isPrivateAccount = val;
                });
              },
            ),
            SwitchListTile(
              title: const Text("Allow Messages"),
              subtitle: const Text("Allow anyone to message you"),
              value: allowMessages,
              onChanged: (val) {
                setState(() {
                  allowMessages = val;
                });
              },
            ),
            Divider(color: isDark ? Colors.white12 : Colors.grey.shade300, height: 32),

            Text(
              "Content Privacy",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.getHeight(context, 8)),
            SwitchListTile(
              title: const Text("Show Activity Status"),
              subtitle: const Text("Let others see when you are online"),
              value: showActivityStatus,
              onChanged: (val) {
                setState(() {
                  showActivityStatus = val;
                });
              },
            ),
            SwitchListTile(
              title: const Text("Allow Tags"),
              subtitle: const Text("Allow others to tag you in posts"),
              value: allowTags,
              onChanged: (val) {
                setState(() {
                  allowTags = val;
                });
              },
            ),
            Divider(color: isDark ? Colors.white12 : Colors.grey.shade300, height: 32),

            // Optional Save button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save privacy settings logic here
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getWidth(context, 32),
                    vertical: SizeConfig.getHeight(context, 12),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
