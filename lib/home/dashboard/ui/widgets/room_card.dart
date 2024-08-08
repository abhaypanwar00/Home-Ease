import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.imagePaths,
    required this.roomNames,
    required this.index,
  });

  final List<String> imagePaths;
  final List<String> roomNames;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 0,
          top: 0,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                roomNames[index],
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
