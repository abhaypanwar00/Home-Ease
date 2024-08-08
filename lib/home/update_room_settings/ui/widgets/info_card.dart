import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/theme/colors.dart';
import 'package:home_ease/home/update_room_settings/cubit/update_room_settings_cubit.dart';
import 'package:home_ease/widgets/divider.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.heading,
    required this.icon,
    this.footer,
    this.subHeading,
    this.subText,
    required this.isLarge,
    this.temp,
  });
  final String heading;
  final IconData icon;
  final Widget? footer;
  final String? subHeading;
  final String? subText;
  final bool isLarge;
  final int? temp;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    log("Info Card Build");
    return BlocProvider(
      create: (context) => UpdateRoomSettingsCubit(),
      child: Card(
        color: SHColors.cardColor,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(width: screenWidth * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<UpdateRoomSettingsCubit,
                          UpdateRoomSettingsState>(
                        builder: (context, state) {
                          bool isSwitchedOn = false;
                          if (state is UpdateRoomSettingsUpdated) {
                            isSwitchedOn = state.isSwitchedOn;
                          }
                          return Icon(
                            icon,
                            size: screenWidth * 0.06,
                            color: isSwitchedOn
                                ? SHColors.selectedColor
                                : Colors.white,
                          );
                        },
                      ),
                      BlocBuilder<UpdateRoomSettingsCubit,
                          UpdateRoomSettingsState>(
                        builder: (context, state) {
                          bool isSwitchedOn = false;
                          if (state is UpdateRoomSettingsUpdated) {
                            isSwitchedOn = state.isSwitchedOn;
                          }
                          return Transform.scale(
                            scale: 0.7,
                            child: Switch(
                              value: isSwitchedOn,
                              onChanged: (newValue) {
                                context
                                    .read<UpdateRoomSettingsCubit>()
                                    .toggleSwitch(newValue);
                              },
                              activeColor: isSwitchedOn
                                  ? SHColors.selectedColor
                                  : Colors.white,
                            ),
                          );
                        },
                      ),
                      BlocBuilder<UpdateRoomSettingsCubit,
                          UpdateRoomSettingsState>(
                        builder: (context, state) {
                          bool isSwitchedOn = false;
                          if (state is UpdateRoomSettingsUpdated) {
                            isSwitchedOn = state.isSwitchedOn;
                          }
                          return Text(
                            isSwitchedOn ? "ON" : "OFF",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: isSwitchedOn
                                      ? SHColors.selectedColor
                                      : Colors.white,
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                  if (isLarge)
                    Text(
                      "$temp°",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20),
                    ),
                ],
              ),
              SizedBox(height: screenWidth * 0.01),
              const SHDivider(),
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 0.02),
                child: footer ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subHeading!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          subText!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 18),
                        )
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
