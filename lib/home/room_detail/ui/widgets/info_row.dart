import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              text1,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ],
        ),
        Text(
          text2,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
