import 'package:ai_app/pages/chat_page.dart';
import 'package:ai_app/services/chat_web_services.dart';
import 'package:ai_app/widgets/search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_app/theme/colors.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();
  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Yo GUrt",
          style: GoogleFonts.ibmPlexSans(
            fontSize: isMobile ? 18 : 20, // Smaller font on mobile
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 32), // Smaller spacing on mobile
        Container(
          // Responsive width that adapts to screen size
          width: isMobile ? screenWidth * 0.9 : 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller:queryController,
                  decoration: InputDecoration(
                    hintText: "Search for anything...",
                    hintStyle: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconGrey,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isNarrow = constraints.maxWidth < 350;
                    
                    return Row(
                      children: [
                        if (!isNarrow) // Hide Focus button on very small screens
                          SearchBarButton(
                            icon: Icons.auto_awesome_outlined,
                            text: "Focus",
                          ),
                        if (!isNarrow) 
                          const SizedBox(width: 8),
                        SearchBarButton(
                          icon: Icons.circle_notifications_outlined,
                          text: isNarrow ? "" : "Search", // Hide text on very small screens
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (queryController.text.trim().isNotEmpty) {
                              ChatWebService().chat(queryController.text.trim());
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    question: queryController.text.trim(),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12), // Slightly larger tap target
                            decoration: BoxDecoration(
                              color: AppColors.submitButton,
                              borderRadius: BorderRadius.circular(40),
                              // Add shadow to make button stand out
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.submitButton,
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.background,
                              size: 18, // Larger icon size for better visibility
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
