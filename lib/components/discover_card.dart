import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/eye_icon.svg',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Explore new depths',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.cyan.shade300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.cyan.shade300,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
