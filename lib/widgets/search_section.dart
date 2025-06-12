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
          decoration:BoxDecoration(color:AppColors.searchBar,),
          child: Column(
            children:[
              TextField(
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
              
            ]
          ),
        )
      ],
    );
  }
}
