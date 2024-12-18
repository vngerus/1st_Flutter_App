import 'package:flutter/material.dart';

class AdoptAppBarWidget extends StatelessWidget {
  const AdoptAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(
        top: 50,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      color: const Color(0xFFDBE8DF),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Avatar
              CircleAvatar(
                backgroundColor: Color(0xFFEE6D2D),
                radius: 30,
              ),
              SizedBox(width: 16),
              // Title
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ora Brock",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Color(0xFF3C2F20),
                    ),
                  ),
                  Text(
                    "Volunteer in pet shelter",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF3C2F20),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "2 adoptions",
                    style: TextStyle(
                      fontSize: 9,
                      color: Color(0xFF8E8E81),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Icon
          Icon(
            Icons.menu,
            color: Color(0xFFEE6D2D),
          ),
        ],
      ),
    );
  }
}

// backgroudColor: #DBE8DF
// orange: #EE6D2D
// brow: #3C2F20
// browLight: #8E8E81
