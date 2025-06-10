import 'package:flutter/material.dart';
import 'package:ai_app/theme/colors.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69, 
      color: AppColors.sideNav,
      child:Column(children: [
        const SizedBox(height: 20,),
        Icon(Icons.adb,
        color:Colors.white,
        size: 30,
        ),
        const SizedBox(height: 60,),
        Icon(Icons.add,
        color:AppColors.iconGrey,
        size: 20,
        ),
        const SizedBox(height: 40,),
        Icon(Icons.search,
        color:AppColors.iconGrey,
        size: 20,
        ),
        const SizedBox(height: 40,),
        Icon(Icons.language,
        color:AppColors.iconGrey,
        size: 20,
        ),
        const SizedBox(height: 40,),
        Icon(Icons.auto_awesome,
        color:AppColors.iconGrey,
        size: 20,
        ),
        const Spacer(),
         const SizedBox(height: 40,),
        Icon(Icons.keyboard_arrow_right,
        color:AppColors.iconGrey,
        size: 20,
        
        ), const SizedBox(height: 20,)
        
      ],));

  }
}
