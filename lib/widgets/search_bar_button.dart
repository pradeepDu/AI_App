import 'package:flutter/material.dart';
import 'package:ai_app/theme/colors.dart';

class SearchBarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchBarButton({super.key,required this.icon,required this.text});

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event){
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      } ,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isHovered ? AppColors.proButton :Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              widget.icon, 
              color: Colors.white, // Force white color for visibility
              size: 24, // Larger size
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
              widget.text, 
              style: const TextStyle(
                color: Colors.white, // Force white color for better visibility
                fontSize: 15, // Slightly larger text
                fontWeight: FontWeight.w500, // Medium weight for better visibility
              ),
            ),
          ],
        ),
      ),
    );
  }
}
