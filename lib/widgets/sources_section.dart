import 'package:ai_app/services/chat_web_services.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/theme/colors.dart';

import 'package:shimmer/shimmer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  List searchResults = [
    {"title": "Wikipedia", "url": "https://en.wikipedia.org/wiki/Soham_Parekh"},
    {"title": "GitHub", "url": "https://hpradeep.vercel.app"},
    {"title": "Wikipedia", "url": "https://en.wikipedia.org/wiki/Soham_Parekh"},
  ];

  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        searchResults = data['data'] ?? [];
        isLoading = false; // Set loading to false after fetching data
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width to make layout responsive
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.source_outlined, 
              color: Colors.white,
              size: isMobile ? 26 : 28, // Larger size for better visibility
              shadows: const [
                Shadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  offset: Offset(1, 1),
                ),
              ], // Add shadow for better visibility
            ),
            SizedBox(width: 8),
            Text(
              "Sources",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        searchResults.isEmpty || isLoading
            ? _buildShimmerLoading()
            : Wrap(
                spacing: 8,
                runSpacing: 16,
                children: searchResults.map<Widget>((res) {
                  final title = res["title"] ?? "Unknown Source";
                  final url = res["url"] ?? "No URL available";
                  
                  // Adjust card width based on screen size
                  final double cardWidth = isMobile
                      ? (screenWidth - 48) / 2 // 2 cards per row on mobile with padding
                      : 200.0; // Fixed width on desktop
                      
                  return Container(
                    width: cardWidth,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(8),
                      // Add subtle border for better visibility
                      border: Border.all(
                        color: Colors.white10,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            url,
                            style: const TextStyle(                              fontSize: 12,
                              color: Colors.white70,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
      ],
    );
  }
  
  Widget _buildShimmerLoading() {
    // Get screen width to make shimmer responsive
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final double cardWidth = isMobile
        ? (screenWidth - 48) / 2 // 2 cards per row on mobile
        : 200.0; // Fixed width on desktop
    final int cardCount = isMobile ? 4 : 3;
    
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Wrap(
        spacing: 8,
        runSpacing: 16,
        children: List.generate(cardCount, (index) {
          return Container(
            width: cardWidth,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: cardWidth * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: cardWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
  }

