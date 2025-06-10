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
    return AnimatedContainer(
      duration:const Duration(milliseconds: 200),
      width: isCollapsed ? 60 : 120,
      color: AppColors.sideNav,
      child: Column(
        
        children: [
           Container(
            margin: EdgeInsets.symmetric(vertical:16,horizontal:16),
            child:Icon(Icons.adb, color: AppColors.iconGrey, size:  isCollapsed ? 30 : 40),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
               
                const SizedBox(height: 40),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.add, text: "Home"),
               
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    child: Icon(
                      isCollapsed ?Icons.keyboard_arrow_right:Icons.keyboard_arrow_left,
                      color: AppColors.iconGrey,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
        ],
      ),
    );
  }
}
