import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:home_ease/theme/icons.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/ac_card.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/back_button.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/info_card.dart';
import 'package:home_ease/widgets/stats_card.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/light_intensity_card.dart';

class UpdateRoomSettings extends StatelessWidget {
  const UpdateRoomSettings({
    super.key,
    required this.roomName,
    required this.image,
  });

  final String roomName;
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.06,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                roomName,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenWidth * 0.25,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    const PopBackButton(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: InfoCard(
                            isLarge: false,
                            heading: "Lights",
                            icon: SHIcons.lightBulbOutline,
                            subHeading: "Time",
                            subText: "2hr 43min",
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        const Expanded(
                          child: InfoCard(
                            isLarge: false,
                            heading: "Music",
                            icon: SHIcons.music,
                            subHeading: "On Top",
                            subText: "Karan Aujla",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const LightIntensityCard(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: InfoCard(
                            isLarge: false,
                            heading: "Humidifier",
                            icon: SHIcons.waterDrop,
                            subHeading: "Air Humidity",
                            subText: "38.0 %",
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        const Expanded(
                          child: InfoCard(
                            isLarge: false,
                            heading: "Purifier",
                            icon: SHIcons.wind,
                            subHeading: "Air Quality",
                            subText: "Moderate",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const AirConditioningCard(),
                    const SizedBox(height: 20),
                    const StatsCard(
                      heading: "Inetrnet",
                      subHeading: "Active",
                      sideText: "250 Mbps",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
