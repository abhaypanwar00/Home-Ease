import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/theme/colors.dart';
import 'package:home_ease/theme/icons.dart';
import 'package:home_ease/home/update_room_settings/cubit/update_room_settings_cubit.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/info_card.dart';

class AirConditioningCard extends StatelessWidget {
  const AirConditioningCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateRoomSettingsCubit, UpdateRoomSettingsState>(
      builder: (context, state) {
        int temp = 27;

        if (state is UpdateRoomSettingsTemperatureUpdated) {
          temp = state.temperature;
        }
        log("AC Card Build");
        return InfoCard(
          isLarge: true,
          heading: "Air Conditioning",
          icon: SHIcons.fan,
          temp: temp,
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.scale(
                scale: 0.8,
                child: Card(
                  color: SHColors.textColor,
                  elevation: 10,
                  child: IconButton(
                    onPressed: () {
                      if (temp > 16) {
                        context
                            .read<UpdateRoomSettingsCubit>()
                            .changeTemperature(temp - 1);
                      }
                    },
                    icon: const Icon(Icons.remove),
                    color: SHColors.cardColor,
                  ),
                ),
              ),
              Text(
                "$temp°",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 25),
              ),
              Transform.scale(
                scale: 0.8,
                child: Card(
                  color: SHColors.textColor,
                  elevation: 10,
                  child: IconButton(
                    onPressed: () {
                      if (temp < 32) {
                        context
                            .read<UpdateRoomSettingsCubit>()
                            .changeTemperature(temp + 1);
                      }
                    },
                    icon: const Icon(Icons.add),
                    color: SHColors.cardColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
