import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:ai_app/services/chat_web_services.dart';
import 'package:shimmer/shimmer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  String fullResponse = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      setState(() {
        fullResponse += data['data'] ?? '';
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: isMobile ? 26 : 28, // Larger size for better visibility
              shadows: const [
                Shadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  offset: Offset(1, 1),
                ),
              ], // Add shadow for better contrast
            ),
            const SizedBox(width: 8),
            Text(
              'Perplexity',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Show shimmer loading or content based on loading state
        isLoading
            ? _buildShimmerLoading()
            : Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10),
                ),
                child: Markdown(
                  data: fullResponse.isEmpty ? "Generating answer..." : fullResponse,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(fontSize: isMobile ? 14 : 16, color: Colors.white),
                    h1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    h2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Paragraph 1
          Container(
            height: 16,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            height: 16,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Heading
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.5,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Paragraph 2
          Container(
            height: 16,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            height: 16,
            width: MediaQuery.of(context).size.width * 0.7,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            height: 16,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // List items
          ...List.generate(
            3,
            (index) => Container(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.only(bottom: 8, left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
