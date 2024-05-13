import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool showText;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.showText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Icon/Button
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle drawer opening
            },
          ),
          // Center Title
          if (showText)
            Column(
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                const Text('Post your feeds',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          // Right Icon/Button
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle profile page navigation
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1), // Height of the border
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: showText ? Colors.grey : Colors.transparent, // Color of the border
                width: 1, // Width of the border
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}