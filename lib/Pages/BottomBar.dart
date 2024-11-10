import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, size: 35),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.comment, color: Colors.black, size: 35),
            label: 'Comments'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.black, size: 35),
          label: 'Profile',
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 191, 191, 191),
    );
  }
}
