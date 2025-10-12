import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ri_stream/utils/app_sizes.dart';
import 'package:ri_stream/features/home/ui/screens/home_screen.dart';
import 'package:ri_stream/features/notification/ui/screens/notification_screen.dart';
import 'package:ri_stream/features/post/ui/screens/add_post_screen.dart';
import 'package:ri_stream/features/profile/ui/screens/profile_screen.dart';
import 'package:ri_stream/features/search/ui/screens/search_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0; // 0-1 left, 2 middle FAB, 3-4 right

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(), // Middle FAB
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color selectedColor =isDark? Colors.tealAccent:Colors.teal;
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
        backgroundColor:isDark? Colors.tealAccent:Colors.teal,
       // backgroundColor: Colors.indigo.shade900,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: SizeConfig.getFont(context, 28),
          color: isDark?Colors.black:Colors.white,
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
              _buildNavItem(Icons.home, "Home", 0, selectedColor, unselectedColor),
              _buildNavItem(Icons.search, "Search", 1, selectedColor, unselectedColor),

              SizedBox(width: SizeConfig.getWidth(context, 48)), // Space for FAB

              // Right 2 items
              _buildNavItem(Icons.notifications, "Alerts", 3, selectedColor, unselectedColor),
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
