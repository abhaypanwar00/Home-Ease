import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: SHColors.backgroundColor,
        title: Text(
          "Home Ease",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
