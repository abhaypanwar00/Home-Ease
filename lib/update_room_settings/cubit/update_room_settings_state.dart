part of 'update_room_settings_cubit.dart';

abstract class UpdateRoomSettingsState extends Equatable {
  const UpdateRoomSettingsState();

  @override
  List<Object> get props => [];
}

class UpdateRoomSettingsInitial extends UpdateRoomSettingsState {}

class UpdateRoomSettingsUpdated extends UpdateRoomSettingsState {
  final bool isSwitchedOn;
  final double lightIntensity;

  const UpdateRoomSettingsUpdated(this.isSwitchedOn, this.lightIntensity);

  @override
  List<Object> get props => [isSwitchedOn, lightIntensity];
}

class UpdateRoomSettingsTemperatureUpdated extends UpdateRoomSettingsState {
  final int temperature;

  const UpdateRoomSettingsTemperatureUpdated(this.temperature);

  @override
  List<Object> get props => [temperature];
}
