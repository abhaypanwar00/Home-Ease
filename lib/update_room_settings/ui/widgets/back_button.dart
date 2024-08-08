import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopBackButton extends StatelessWidget {
  const PopBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log("Back Button Build");
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.back,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            "BACK",
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
