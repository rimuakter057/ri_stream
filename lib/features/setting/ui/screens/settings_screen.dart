

import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/change_password_screen.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/privacy_policy/ui/screens/privacy_policy_screen.dart';
import 'package:ri_stream/features/privacy_policy/ui/screens/privacy_screen.dart';
import 'package:ri_stream/main.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDark;
  final Function(bool)? onThemeChanged;
  const SettingsScreen({super.key, this.isDark = true, this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section
          Text(
            "Profile",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.3),
              child: const Icon(Icons.person, size: 28),
            ),
            title: const Text("User Name"),
            subtitle: const Text("@username"),
            trailing: Icon(Icons.edit, color: theme.colorScheme.primary),
            onTap: () {
              // Navigate to Edit Profile
            },
          ),
          const Divider(height: 32),

          // Account Section
          Text(
            "Account",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Change Password"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>ChangePasswordScreen (),
                ), // target screen
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Privacy"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>PrivacySettingsScreen (),
                ), // target screen
              );
            },
          ),
          const Divider(height: 32),

          // Notifications
          Text(
            "Notifications",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Push Notifications"),
            value: true,
            onChanged: (val) {
              // Handle toggle
            },
          ),
          SwitchListTile(
            title: const Text("In-App Notifications"),
            value: false,
            onChanged: (val) {
              // Handle toggle
            },
          ),
          const Divider(height: 32),

          // Theme Switch



          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDark,
            onChanged: (value) {
              themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
          const Divider(height: 32),

          // About / Terms
          Text(
            "App Info",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),

              onTap:  () {
                showAboutDialog(
                  context: context,
                  applicationName: 'RiStream',
                  applicationVersion: '1.0.0',
                  applicationIcon: Icon(Icons.flutter_dash, size: 50),
                  children: [
                    Text('This app is developed by Your Name.'),
                    Text('Visit https://example.com for more info'),
                  ],
                );
              },

          ),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text("Privacy Policy"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PrivacyPolicyScreen(),
                ), // target screen
              );
            },
          ),
          const Divider(height: 32),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SignInScreen(),
                ), // target screen
              );
            },
          ),
        ],
      ),
    );
  }
}
