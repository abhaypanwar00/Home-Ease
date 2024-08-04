import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/home/cubit/home_cubit.dart';

class RoomsPageView extends StatelessWidget {
  final PageController controller;

  final roomNames = [
    'LIVING ROOM',
    'DINING ROOM',
    'BED ROOM',
    'KITCHEN',
    'BATHROOM',
  ];

  final List<String> imagePaths = [
    'assets/images/living_room.jpeg',
    'assets/images/dining_room.jpeg',
    'assets/images/bed_room.jpg',
    'assets/images/kitchen.jpg',
    'assets/images/bathroom.jpg',
  ];

  RoomsPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: roomNames.length,
      onPageChanged: (index) {
        context.read<HomeCubit>().updatePageIndex(index.toDouble());
      },
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
