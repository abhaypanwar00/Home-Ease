import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_room_settings_state.dart';

class UpdateRoomSettingsCubit extends Cubit<UpdateRoomSettingsState> {
  UpdateRoomSettingsCubit()
      : super(const UpdateRoomSettingsUpdated(false, 20.0));

  void toggleSwitch(bool newValue) {
    final currentState = state as UpdateRoomSettingsUpdated;
    emit(UpdateRoomSettingsUpdated(newValue, currentState.lightIntensity));
  }

  void updateIntensity(double newValue) {
    final currentState = state as UpdateRoomSettingsUpdated;
    emit(UpdateRoomSettingsUpdated(currentState.isSwitchedOn, newValue));
  }

  void changeTemperature(int newTemperature) {
    emit(UpdateRoomSettingsTemperatureUpdated(newTemperature));
  }
}
