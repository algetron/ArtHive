import 'package:flutter/material.dart';

class ArtisanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArtisanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 171, 214, 167),
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'images/logo2.png',
            height: 30,
          ),
          const SizedBox(width: 8),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Color.fromARGB(221, 0, 0, 0)),
          onPressed: () {
            // Handle settings action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
