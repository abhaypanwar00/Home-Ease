import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/theme/colors.dart';
import 'package:home_ease/theme/icons.dart';
import 'package:home_ease/home/update_room_settings/cubit/update_room_settings_cubit.dart';
import 'package:home_ease/widgets/divider.dart';

class LightIntensityCard extends StatelessWidget {
  const LightIntensityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    log("Light Intensity Card Build");
    return BlocProvider(
      create: (context) => UpdateRoomSettingsCubit(),
      child: SizedBox(
        width: screenWidth,
        child: Card(
          color: SHColors.cardColor,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Light Intensity",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    BlocBuilder<UpdateRoomSettingsCubit,
                        UpdateRoomSettingsState>(
                      builder: (context, state) {
                        final lightIntensity =
                            state is UpdateRoomSettingsUpdated
                                ? state.lightIntensity
                                : 20.0;
                        return Text(
                          "${lightIntensity.toInt()}%",
                          style: Theme.of(context).textTheme.titleMedium,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.05),
                const SHDivider(),
                SizedBox(height: screenWidth * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(SHIcons.lightMin),
                    Expanded(
                      child: BlocBuilder<UpdateRoomSettingsCubit,
                          UpdateRoomSettingsState>(
                        builder: (context, state) {
                          final lightIntensity =
                              state is UpdateRoomSettingsUpdated
                                  ? state.lightIntensity
                                  : 20.0;
                          return Slider(
                            value: lightIntensity,
                            min: 0,
                            max: 100,
                            label: lightIntensity.toInt().toString(),
                            onChanged: (newValue) {
                              context
                                  .read<UpdateRoomSettingsCubit>()
                                  .updateIntensity(newValue);
                            },
                          );
                        },
                      ),
                    ),
                    const Icon(SHIcons.lightMax),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
