import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class PageIndicator extends StatelessWidget {
  final double pageIndex;
  final int length;

  const PageIndicator({
    required this.pageIndex,
    required this.length,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final index = pageIndex;
    log("Page Indicator ${index + 1}");
    return SizedBox(
      height: 12,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < length; i++) ...[
                const _Dot(),
                if (i < length - 1) const SizedBox(width: 16),
              ],
            ],
          ),
          Positioned(
            left: (16 * index) + (6 * index),
            child: const _BorderDot(),
          )
        ],
      ),
    );
  }
}

class _BorderDot extends StatelessWidget {
  const _BorderDot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          color: SHColors.backgroundColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 6,
      height: 6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
