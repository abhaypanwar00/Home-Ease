import 'package:flutter/material.dart';
import 'package:home_ease/theme/icons.dart';
import 'package:home_ease/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.white,
        unselectedItemColor: SHColors.hintColor,
        backgroundColor: SHColors.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(SHIcons.stats),
            ),
            label: 'STATISTICS',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(SHIcons.home),
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(SHIcons.settings),
            ),
            label: 'SETTINGS',
          ),
        ],
      ),
    );
  }
}
