import 'package:flutter/material.dart';
import 'package:home_ease/home/ui/widgets/room_card.dart';
import 'package:home_ease/widgets/divider.dart';
import 'package:home_ease/room_detail/ui/widgets/info_column.dart';
import 'package:home_ease/room_detail/ui/widgets/info_row.dart';
import 'package:home_ease/theme/colors.dart';
import 'package:home_ease/theme/icons.dart';
import 'package:home_ease/update_room_settings/ui/screens/update_room_settings.dart';

class RoomDetailScreen extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> roomNames;
  final int index;

  const RoomDetailScreen({
    super.key,
    required this.imagePaths,
    required this.roomNames,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: screenWidth * 0.1,
            child: Center(
              child: SizedBox(
                height: screenHeight * 0.7,
                width: screenWidth * 0.9,
                child: Card(
                  color: SHColors.cardColor,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.03,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const InfoRow(
                          icon: SHIcons.thermostat,
                          text1: "Temperature",
                          text2: "27°",
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        const InfoRow(
                          icon: SHIcons.waterDrop,
                          text1: "Air Humidity",
                          text2: "38.0%",
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        const InfoRow(
                          icon: SHIcons.airQuality,
                          text1: "Air Quality",
                          text2: "Moderate",
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        const SHDivider(),
                        SizedBox(height: screenHeight * 0.02),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoColumn(
                              icon: SHIcons.lightBulbOutline,
                              text1: "Lights",
                              text2: "ON",
                              color: SHColors.selectedColor,
                            ),
                            InfoColumn(
                              icon: SHIcons.fan,
                              text1: "Air-Conditioning",
                              text2: "OFF",
                              color: SHColors.textColor,
                            ),
                            InfoColumn(
                              icon: SHIcons.music,
                              text1: "Music",
                              text2: "OFF",
                              color: SHColors.textColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.07,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: screenHeight * 0.55,
                width: screenWidth * 0.75,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.primaryDelta! > 10) {
                      Navigator.of(context).pop();
                    }
                  },
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UpdateRoomSettings(
                          roomName: roomNames[index],
                          image: imagePaths[index],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'roomCard-$index',
                    child: RoomCard(
                      imagePaths: imagePaths,
                      roomNames: roomNames,
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
