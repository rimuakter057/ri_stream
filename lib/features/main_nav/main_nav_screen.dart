import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ri_stream/features/live/ui/screens/live_video_screen.dart';
import 'package:ri_stream/features/message/ui/screens/message_screen.dart';
import 'package:ri_stream/features/shorts/ui/screens/shorts_screen.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/features/notification/ui/screens/notification_screen.dart';
import 'package:ri_stream/features/post/ui/screens/add_post_screen.dart';
import 'package:ri_stream/features/profile/ui/screens/profile_screen.dart';


class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0; // 0-1 left, 2 middle FAB, 3-4 right

  final List<Widget> _screens = [
    const MessageScreen(),
    const LiveVideoScreen(),
    const AddPostScreen(), // Middle FAB
    const ShortVideoScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color selectedColor =isDark? Colors.red.shade900:Colors.red.shade900;
    Color unselectedColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;
    Color bottomBarBg = isDark ? Colors.black : Colors.white;

    return Scaffold(
      body: _currentIndex == 2
          ? _screens[2] // Middle FAB
          : _screens[_currentIndex < 2 ? _currentIndex : _currentIndex],

      // Middle FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2; // Middle screen (Add Post)
          });
        },
        //backgroundColor:isDark? Colors.white54:Colors.teal,
       backgroundColor: _currentIndex == 2
              ? (isDark ? Colors.red.shade900 : Colors.red.shade900)       // Selected color
              : (isDark ? Colors.white54 : Colors.grey.shade300),   shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: SizeConfig.getFont(context, 42),
          color:Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: bottomBarBg,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: SizeConfig.getHeight(context, 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left 2 items
              _buildNavItem(Icons.chat, "Message", 0, selectedColor, unselectedColor),
              _buildNavItem(Icons.fiber_manual_record, "live", 1, selectedColor, unselectedColor),

              SizedBox(width: SizeConfig.getWidth(context, 48)), // Space for FAB

              // Right 2 items
              _buildNavItem(Icons.video_collection_outlined, "Shorts", 3, selectedColor, unselectedColor),
              _buildNavItem(Icons.person, "Profile", 4, selectedColor, unselectedColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, Color selectedColor, Color unselectedColor) {
    bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: SizeConfig.getFont(context, 28),
            color: isActive ? selectedColor : unselectedColor,
          ),
          SizedBox(height: SizeConfig.getHeight(context, 4)),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: SizeConfig.getFont(context, 12),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive ? selectedColor : unselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
