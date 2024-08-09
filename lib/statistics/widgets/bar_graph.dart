import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:home_ease/statistics/data/bar_data.dart';
import 'package:home_ease/theme/colors.dart';

class MyBarGraph extends StatelessWidget {
  const MyBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      janAmount: 272,
      febAmount: 212,
      marAmount: 250,
      aprAmount: 264,
      mayAmount: 198,
      junAmount: 225,
    );
    myBarData.initializeBarData();

    return Stack(
      children: [
        BarChart(
          BarChartData(
            maxY: 300,
            minY: 0,
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getBottomTitles,
                ),
              ),
            ),
            barGroups: myBarData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        color: SHColors.textColor,
                        width: MediaQuery.of(context).size.width * 0.14,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: myBarData.barData.map(
                  (data) {
                    final double left = (data.x - 1) *
                        (constraints.maxWidth / myBarData.barData.length);
                    final double top = constraints.maxHeight -
                        (data.y / 300 * constraints.maxHeight);
                    return Positioned(
                      left: left + 8,
                      top: top - 22,
                      child: Text(
                        "${data.y.toInt()} KWh",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text("JAN");
      break;
    case 2:
      text = const Text("FEB");
      break;
    case 3:
      text = const Text("MAR");
      break;
    case 4:
      text = const Text("APR");
      break;
    case 5:
      text = const Text("MAY");
      break;
    case 6:
      text = const Text("JUN");
      break;
    default:
      text = const Text("");
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
