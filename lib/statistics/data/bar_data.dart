import 'package:home_ease/statistics/widgets/individual_bar.dart';

class BarData {
  final double janAmount;
  final double febAmount;
  final double marAmount;
  final double aprAmount;
  final double mayAmount;
  final double junAmount;

  BarData({
    required this.janAmount,
    required this.febAmount,
    required this.marAmount,
    required this.aprAmount,
    required this.mayAmount,
    required this.junAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 1, y: janAmount),
      IndividualBar(x: 2, y: febAmount),
      IndividualBar(x: 3, y: marAmount),
      IndividualBar(x: 4, y: aprAmount),
      IndividualBar(x: 5, y: mayAmount),
      IndividualBar(x: 6, y: junAmount),
    ];
  }
}
