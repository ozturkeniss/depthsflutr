import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('assets/home_icon.svg', true),
          _buildNavItem('assets/search_icon.svg', false),
          _buildNavItem('assets/play_icon.svg', false, isPlay: true),
          _buildNavItem('assets/heart_icon.svg', false),
          _buildNavItem('assets/settings_nav_icon.svg', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(String assetPath, bool isActive, {bool isPlay = false}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isActive ? Colors.cyan.withOpacity(0.2) : Colors.transparent,
        shape: BoxShape.circle,
        border: isActive ? Border.all(
          color: Colors.cyan.withOpacity(0.4),
          width: 1,
        ) : null,
        boxShadow: isActive ? [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ] : null,
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
          colorFilter: isPlay ? ColorFilter.mode(
            Colors.red,
            BlendMode.srcIn,
          ) : null,
        ),
      ),
    );
  }
}
