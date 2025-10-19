import 'package:flutter/material.dart';
import 'package:ri_stream/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ri_stream/features/profile/ui/screens/profile_screen.dart';
import 'package:ri_stream/features/setting/ui/screens/settings_screen.dart';
import 'package:ri_stream/main.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/theme/app_theme.dart'; // তোমার AppTheme import

class CustomDrawer extends StatelessWidget {



  const CustomDrawer({super.key, });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = theme.textTheme.bodyMedium!.color;
    final iconColor = theme.iconTheme.color;

    return Drawer(
      backgroundColor: bgColor,
      child: Column(
        children: [
          // Header
          SizedBox(height: SizeConfig.getHeight(context, 24),),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.getHeight(context, 20),
              horizontal: SizeConfig.getWidth(context, 16),
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.getHeight(context, 30),
                  backgroundImage: AssetImage('assets/icons/logo.png'),
                ),
                SizedBox(width: SizeConfig.getWidth(context, 12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'John Doe',
                        style: theme.textTheme.bodyLarge
                    ),
                    SizedBox(height: SizeConfig.getHeight(context, 4)),
                    Text(
                      'john.doe@email.com',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: textColor!.withOpacity(0.7)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(context, 12)),

          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerRow(
                  context,
                  icon: Icons.person,
                  label: 'Profile',
                  iconColor: iconColor!,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  iconColor: iconColor,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.privacy_tip,
                  label: 'Privacy',
                  iconColor: iconColor,

                  onTap: () {},
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.description,
                  label: 'Terms & Conditions',
                  iconColor: iconColor,

                  onTap: () {},
                ),

                _buildDrawerRow(
                  context,
                  icon: Icons.help_outline,
                  label: 'Help',
                  iconColor: iconColor,

                  onTap: () {},
                ),

                _buildDrawerRow(
                  context,
                  icon: Icons.logout,
                  label: 'Logout',
                  iconColor: iconColor,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerRow(BuildContext context, {
    required IconData icon,
    required String label,
    required Color iconColor,

    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context); // Theme context থেকে নাও

    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: iconColor,
            size: SizeConfig.getHeight(context, 24),
          ),
          title: Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade50,
          thickness: 1,
          indent: SizeConfig.getWidth(context, 16),
          endIndent: SizeConfig.getWidth(context, 16),
        ),
      ],
    );
  }
}