import 'package:ai_app/theme/colors.dart';
import 'package:ai_app/widgets/side_bar.dart';
import 'package:ai_app/widgets/sources_section.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/widgets/answer_section.dart';

class ChatPage extends StatelessWidget {
  final String question;

  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions to determine layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Scaffold(
      // Show app bar only on mobile with more visible icons
      appBar: isMobile ? AppBar(
        backgroundColor: AppColors.background,
        title: const Text('AI Assistant', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white, size: 28, opacity: 1.0),
      ) : null,
      // Don't show sidebar in drawer on mobile
      body: SafeArea(
        child: isMobile 
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    // Get screen width for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SingleChildScrollView(
      // Add physics for better scrolling behavior
      physics: const ClampingScrollPhysics(),
      child: Padding(
        // Reduce padding on smaller screens
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question section with constrained width
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                question,
                style: TextStyle(
                  fontSize: screenWidth < 400 ? 20 : 24, // Smaller font on very small screens
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                // Prevent text overflow
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            
            // Answer section
            const AnswerSection(),
            
            // Sources section
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SourcesSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sidebar for desktop
        const SideBar(),
        
        // Main content area
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    question,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                
                // Answer section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AnswerSection(),
                ),
                
                // Sources section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SourcesSection(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
