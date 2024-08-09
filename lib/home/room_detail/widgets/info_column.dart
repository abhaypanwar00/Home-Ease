import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.color,
  });

  final IconData icon;
  final String text1;
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
        ),
        Text(
          text2,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}
