import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:home_ease/theme/icons.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/ac_card.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/back_button.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/info_card.dart';
import 'package:home_ease/widgets/stats_card.dart';
import 'package:home_ease/home/update_room_settings/ui/widgets/light_intensity_card.dart';

class UpdateRoomSettings extends StatefulWidget {
  const UpdateRoomSettings({
    super.key,
    required this.roomName,
    required this.image,
    required this.index,
  });

  final String roomName;
  final String image;
  final int index;

  @override
  UpdateRoomSettingsState createState() => UpdateRoomSettingsState();
}

class UpdateRoomSettingsState extends State<UpdateRoomSettings>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'roomCard-${widget.index}',
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
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
          ),
          Positioned(
            top: screenHeight * 0.06,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                widget.roomName,
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
                child: SlideTransition(
                  position: _slideAnimation,
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
                        heading: "Internet",
                        subHeading: "Active",
                        sideText: "250 Mbps",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
