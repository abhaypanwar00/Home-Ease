import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class DevicesCard extends StatelessWidget {
  const DevicesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: SHColors.cardColor,
      elevation: 10,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DevicesColumn(
              icon: Icons.devices,
              rowText: "52",
              columnText: "Total Devices",
            ),
            DevicesColumn(
              icon: Icons.local_activity_rounded,
              rowText: "15",
              columnText: "Active Devices",
            ),
            DevicesColumn(
              icon: Icons.light,
              rowText: "326 KWh",
              columnText: "Monthly Average",
            ),
          ],
        ),
      ),
    );
  }
}

class DevicesColumn extends StatelessWidget {
  const DevicesColumn({
    super.key,
    required this.icon,
    required this.rowText,
    required this.columnText,
  });

  final IconData icon;
  final String rowText;
  final String columnText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              rowText,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(columnText),
      ],
    );
  }
}
