import 'package:flutter/material.dart';
import 'package:home_ease/statistics/stats_data.dart';
import 'package:home_ease/widgets/stats_card.dart';
import 'package:home_ease/statistics/bar_graph.dart';
import 'package:home_ease/theme/lighted_background.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: screenWidth * 0.05),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const MyBarGraph(),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Electricity  Monthly Expenses",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return StatsCard(
                      heading: StatsData().monthName[index],
                      subHeading: StatsData().lightEnergy[index],
                      sideText: StatsData().lightBill[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
