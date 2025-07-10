import 'package:ai_app/widgets/side_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/theme/colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device - only show sidebar on larger screens
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    // Don't render the sidebar at all on mobile
    if (isMobile) {
      return const SizedBox.shrink(); // Return empty widget on mobile
    }
    
    return AnimatedContainer(
      duration:const Duration(milliseconds: 200),
      width: isCollapsed ? 60 : 120,
      color: AppColors.sideNav,
      child: Column(
        
        children: [
           Container(
            margin: const EdgeInsets.symmetric(vertical:16, horizontal:16),
            child: Icon(
              Icons.adb, 
              color: Colors.white, // Use white for better visibility
              size: isCollapsed ? 34 : 44, // Larger icon size
              shadows: const [
                Shadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  offset: Offset(1, 1),
                ),
              ], // Add shadow for better contrast
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
               
                const SizedBox(height: 40),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.home, text: "Home"),
               
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.search, text: "Search"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.language, text: "Create"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.auto_awesome, text: "Discover"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.cloud_outlined, text: "Library"),
                const Spacer(),
            
              
              ],
            ),
          ),
          GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white10, width: 1),
                    ),
                    child: Icon(
                      isCollapsed ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 24, // Larger size
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 3,
                          offset: Offset(1, 1),
                        ),
                      ], // Add shadow for better contrast
                    ),
                  ),
                ),
                const SizedBox(height: 20),
        ],
      ),
    );
  }
}
