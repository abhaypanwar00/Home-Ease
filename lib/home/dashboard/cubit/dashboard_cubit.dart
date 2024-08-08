import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  void updatePageIndex(double pageIndex) {
    emit(state.copyWith(pageIndex: pageIndex));
  }

  void updateSelectedIndex(int selectedIndex) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}
