import 'package:flutter/material.dart';
import 'package:home_ease/home/ui/home_screen.dart';
import 'package:home_ease/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: SHTheme.dark,
      home: const HomeScreen(),
    );
  }
}
