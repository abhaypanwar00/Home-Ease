part of 'room_detail_cubit.dart';

sealed class RoomDetailState extends Equatable {
  const RoomDetailState();

  @override
  List<Object> get props => [];
}

final class RoomDetailInitial extends RoomDetailState {}
