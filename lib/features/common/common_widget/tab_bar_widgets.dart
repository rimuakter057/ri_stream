import 'package:flutter/material.dart';
import 'custom_container.dart'; // if CustomContainer is separate

class SocialMediaTabBarMini extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabContent;

  const SocialMediaTabBarMini({
    super.key,
    required this.tabs,
    required this.tabContent,
  });

  @override
  _SocialMediaTabBarMiniState createState() => _SocialMediaTabBarMiniState();
}

class _SocialMediaTabBarMiniState extends State<SocialMediaTabBarMini>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.tabs.length,
            itemBuilder: (context, index) {
              bool isSelected = _tabController.index == index;
              return GestureDetector(
                onTap: () {
                  _tabController.animateTo(index);
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomContainer(
                    borderRadius: 24,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    color: isSelected
                        ? (isDark(context) ? Colors.white12 : Colors.teal)
                        : Colors.grey.withOpacity(0.2),
                    child: Text(
                      widget.tabs[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isSelected ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Tab Content
        SizedBox(
          height: 200, // adjust height as needed
          child: TabBarView(
            controller: _tabController,
            children: widget.tabContent,
          ),
        ),
      ],
    );
  }
}
