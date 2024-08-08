import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';
import 'package:home_ease/theme/icons.dart';

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
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(context, SHIcons.stats, 'STATISTICS', 0),
          _buildNavItem(context, SHIcons.home, 'HOME', 1),
          _buildNavItem(context, SHIcons.settings, 'SETTINGS', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final bool isSelected = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      splashFactory: NoSplash.splashFactory,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.white : SHColors.hintColor,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: isSelected ? Colors.white : SHColors.hintColor,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
