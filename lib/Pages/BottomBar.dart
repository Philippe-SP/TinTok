import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setCurrentIndex(index),
      selectedItemColor: Colors.blue[900],
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.comment, size: 35), label: 'Comments'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 35),
          label: 'Profile',
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 191, 191, 191),
    );
  }
}
