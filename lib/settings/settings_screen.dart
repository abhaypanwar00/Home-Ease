import 'package:flutter/material.dart';
import 'package:home_ease/theme/lighted_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}
