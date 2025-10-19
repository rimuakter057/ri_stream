import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/theme/app_theme.dart'; // তোমার AppTheme import

class CustomDrawer extends StatelessWidget {
  final bool isDark;
  final Function(bool)? onThemeChanged;

  const CustomDrawer({super.key, this.isDark = false, this.onThemeChanged});

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
                  textColor: textColor!,
                  onTap: () {
                    // Navigate to profile
                  },
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  iconColor: iconColor,
                  textColor: textColor,
                  onTap: () {},
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.privacy_tip,
                  label: 'Privacy',
                  iconColor: iconColor,
                  textColor: textColor,
                  onTap: () {},
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.description,
                  label: 'Terms & Conditions',
                  iconColor: iconColor,
                  textColor: textColor,
                  onTap: () {},
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.info_outline,
                  label: 'About',
                  iconColor: iconColor,
                  textColor: textColor,
                  onTap: () {},
                ),
                _buildDrawerRow(
                  context,
                  icon: Icons.help_outline,
                  label: 'Help',
                  iconColor: iconColor,
                  textColor: textColor,
                  onTap: () {},
                ),

                // Theme switch
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getWidth(context, 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.dark_mode, color: iconColor),
                          SizedBox(width: SizeConfig.getWidth(context, 12)),
                          Text(
                            'Dark Theme',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Switch(
                        value: isDark,
                        onChanged: onThemeChanged,
                        activeColor: theme.primaryColor,
                      ),
                    ],
                  ),
                ),

                _buildDrawerRow(
                  context,
                  icon: Icons.logout,
                  label: 'Logout',
                  iconColor: iconColor,
                  textColor: textColor,
                  onTap: () {
                    // Logout action
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
    required Color textColor,
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
            style: theme.textTheme.bodyMedium, // <-- theme থেকে style
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