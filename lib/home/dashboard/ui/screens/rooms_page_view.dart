import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/home/dashboard/cubit/dashboard_cubit.dart';
import 'package:home_ease/home/dashboard/ui/widgets/room_card.dart';
import 'package:home_ease/home/room_detail/screens/room_detail_screen.dart';

class RoomsPageView extends StatelessWidget {
  final PageController controller;

  final roomNames = [
    'BED ROOM',
    'DINING ROOM',
    'LIVING ROOM',
    'KITCHEN',
    'BATHROOM',
  ];

  final List<String> imagePaths = [
    'assets/images/bed_room.jpg',
    'assets/images/dining_room.jpeg',
    'assets/images/living_room.jpeg',
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
        context.read<DashboardCubit>().updatePageIndex(index.toDouble());
      },
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.primaryDelta! < -10) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RoomDetailScreen(
                      imagePaths: imagePaths,
                      roomNames: roomNames,
                      index: index,
                    ),
                  ),
                );
              }
            },
            onTap: () {},
            child: Hero(
              tag: 'roomCard-$index',
              child: RoomCard(
                imagePaths: imagePaths,
                roomNames: roomNames,
                index: index,
              ),
            ),
          ),
        );
      },
    );
  }
}
