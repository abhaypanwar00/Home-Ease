import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/home/dashboard/ui/widgets/page_indicator.dart';
import 'package:home_ease/home/dashboard/ui/screens/rooms_page_view.dart';
import 'package:home_ease/home/dashboard/cubit/dashboard_cubit.dart';
import 'package:home_ease/home/dashboard/cubit/dashboard_state.dart';
import 'package:home_ease/settings/settings_screen.dart';
import 'package:home_ease/statistics/stats_screen.dart';
import 'package:home_ease/theme/lighted_background.dart';
import 'package:home_ease/widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home Ease",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            log("Page View ${state.pageIndex + 1}");
            return _getPage(state.selectedIndex, context);
          },
        ),
        bottomNavigationBar: BlocSelector<DashboardCubit, DashboardState, int>(
          selector: (state) => state.selectedIndex,
          builder: (context, selectedIndex) {
            log("Bottom Nav");
            return BottomNavBar(
              currentIndex: selectedIndex,
              onTap: (index) =>
                  context.read<DashboardCubit>().updateSelectedIndex(index),
            );
          },
        ),
      ),
    );
  }

  Widget _getPage(int selectedIndex, BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const StatisticsScreen();
      case 1:
        return Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "SELECT A ROOM",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  BlocBuilder<DashboardCubit, DashboardState>(
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
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                log("Page Indicator ${state.pageIndex + 1}");
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: PageIndicator(pageIndex: state.pageIndex, length: 5),
                );
              },
            ),
          ],
        );
      case 2:
        return const SettingsScreen();
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}
