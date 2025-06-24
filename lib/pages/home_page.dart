import 'package:ai_app/widgets/search_section.dart';
import 'package:ai_app/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( // Changed from Row to Column
        children: [
          Expanded( // Main content area
            child: Row(
              children: [
                const SideBar(),
                const Expanded(
                  child: SearchSection(),
                ),
              ],
            ),
          ),
          // Footer at the bottom
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            color: AppColors.background, // Optional: add background color
            child: Wrap(
              alignment: WrapAlignment.center, // Center the footer content
              children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Enterprise',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.footerGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Privacy',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.footerGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Terms',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.footerGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Pro',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.footerGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}