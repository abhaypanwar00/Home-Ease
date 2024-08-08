import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.sideText,
  });

  final String heading;
  final String subHeading;
  final String sideText;

  @override
  Widget build(BuildContext context) {
    log("Stats Card Build");
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
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
                    heading,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    subHeading,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
              Center(
                child: Text(
                  sideText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
