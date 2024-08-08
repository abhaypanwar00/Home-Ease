import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class InternetCard extends StatelessWidget {
  const InternetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log("Internet Card Build");
    return Card(
      color: SHColors.cardColor,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Internet",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Active",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18),
                ),
              ],
            ),
            Center(
              child: Text(
                "250 Mbps",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
