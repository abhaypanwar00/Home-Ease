import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final double pageIndex;
  final int selectedIndex;

  const HomeState({required this.pageIndex, required this.selectedIndex});

  factory HomeState.initial() {
    return const HomeState(pageIndex: 0, selectedIndex: 1);
  }

  HomeState copyWith({double? pageIndex, int? selectedIndex}) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [pageIndex, selectedIndex];
}
