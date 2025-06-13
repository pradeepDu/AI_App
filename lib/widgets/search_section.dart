import 'package:ai_app/widgets/search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_app/theme/colors.dart';


class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Yo GUrt",
        style:GoogleFonts.ibmPlexSans(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height:1.2,
          letterSpacing: -0.5,
        ),
        ),
        const SizedBox(height: 32),
        Container(
          width:700,
          decoration:BoxDecoration(color:AppColors.searchBar,
          borderRadius: BorderRadius.circular(10)),
          
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration:InputDecoration(
                    hintText: "Search for anything...",
                    hintStyle: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconGrey,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children:[
                   SearchBarButton(
                    icon: Icons.auto_awesome_outlined,
                    text:"Focus",
                   ),
                   const SizedBox(height: 8),
                   SearchBarButton(
                    icon:Icons.circle_notifications_outlined,
                    text : "Search",
                   ),
                   const Spacer(
                    
                   ),
                   Container(
                    padding: EdgeInsets.all(10) ,
                    decoration:BoxDecoration(
                     color: AppColors.submitButton,
                     borderRadius: BorderRadius.circular(40), 
                    ),
                    child: const Icon(Icons.arrow_forward,color:AppColors.background, size: 15,),
                   )  
                  ]
                ), 
              )
            ]
          ),
        )
      ],
    );
  }
}
