import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class SettingsInfoCard extends StatelessWidget {
  const SettingsInfoCard({
    super.key,
    required this.icon,
    required this.text1,
    this.text2,
  });

  final IconData icon;
  final String text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    log("Settings Info Card");
    return Card(
      color: SHColors.cardColor,
      elevation: 10,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 15),
              Text(
                text1,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 5),
              Text(
                text2!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
