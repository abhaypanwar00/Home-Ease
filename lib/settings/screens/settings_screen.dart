import 'package:flutter/material.dart';
import 'package:home_ease/settings/widgets/devices_card.dart';
import 'package:home_ease/settings/widgets/profile_card.dart';
import 'package:home_ease/settings/widgets/settings_info_card.dart';
import 'package:home_ease/theme/lighted_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileCard(),
              const SizedBox(height: 10),
              const DevicesCard(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Information",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 10),
              const Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SettingsInfoCard(
                        icon: Icons.devices,
                        text1: "Devices",
                        text2: "( 52 )",
                      ),
                      SizedBox(height: 10),
                      SettingsInfoCard(
                        icon: Icons.bed_outlined,
                        text1: "Rooms",
                        text2: "( 6 )",
                      ),
                      SizedBox(height: 10),
                      SettingsInfoCard(
                        icon: Icons.notifications,
                        text1: "Notification",
                        text2: "",
                      ),
                      SizedBox(height: 10),
                      SettingsInfoCard(
                        icon: Icons.help,
                        text1: "Help",
                        text2: "",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
