import 'package:flutter/material.dart';
import 'package:home_ease/theme/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 10,
          color: SHColors.cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Abhay Panwar",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text("abhaypanwar@gmail.com"),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -35,
          left: 25,
          child: Material(
            elevation: 5,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: CircleAvatar(
              backgroundColor: SHColors.hintColor,
              radius: 35,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/profile.jpg",
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
