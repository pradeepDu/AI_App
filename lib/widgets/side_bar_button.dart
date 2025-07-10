import 'package:flutter/material.dart';


class SideBarButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String text;
  // This should be passed from the parent widget or managed with a state management solution
  const SideBarButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
  });

    @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: isCollapsed ? 8 : 16,
      ),
      child: Row(
        mainAxisAlignment: isCollapsed 
          ? MainAxisAlignment.center 
          : MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28, // Larger size for better visibility
            semanticLabel: text, // Add semantic label for accessibility
          ),
          if (!isCollapsed) ...[
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
