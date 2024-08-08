import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final double pageIndex;
  final int selectedIndex;

  const DashboardState({required this.pageIndex, required this.selectedIndex});

  factory DashboardState.initial() {
    return const DashboardState(pageIndex: 0, selectedIndex: 1);
  }

  DashboardState copyWith({double? pageIndex, int? selectedIndex}) {
    return DashboardState(
      pageIndex: pageIndex ?? this.pageIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [pageIndex, selectedIndex];
}
