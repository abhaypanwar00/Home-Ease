import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/home/ui/widgets/page_indicator.dart';
import 'package:home_ease/home/ui/screens/rooms_page_view.dart';
import 'package:home_ease/home/cubit/home_cubit.dart';
import 'package:home_ease/home/cubit/home_state.dart';
import 'package:home_ease/theme/lighted_background.dart';
import 'package:home_ease/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home Ease",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "SELECT A ROOM",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      log("Page View ${state.pageIndex + 1}");
                      return RoomsPageView(
                        controller: PageController(viewportFraction: 0.8),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                log("Page Indicator ${state.pageIndex + 1}");
                return PageIndicator(pageIndex: state.pageIndex, length: 5);
              },
            ),
            BlocSelector<HomeCubit, HomeState, int>(
              selector: (state) => state.selectedIndex,
              builder: (context, selectedIndex) {
                log("Bottom Nav");
                return BottomNavBar(
                  currentIndex: selectedIndex,
                  onTap: (index) =>
                      context.read<HomeCubit>().updateSelectedIndex(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
