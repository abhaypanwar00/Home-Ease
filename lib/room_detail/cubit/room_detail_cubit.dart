import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'room_detail_state.dart';

class RoomDetailCubit extends Cubit<RoomDetailState> {
  RoomDetailCubit() : super(RoomDetailInitial());
}
