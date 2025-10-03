import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';
import '../settings.dart';
import '../favourites.dart';

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
          _buildNavItem(
            context,
            'assets/home_icon.svg',
            true,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
                (route) => false,
              );
            },
          ),
          _buildNavItem(context, 'assets/search_icon.svg', false),
          _buildNavItem(context, 'assets/play_icon.svg', false, isPlay: true),
          _buildNavItem(
            context,
            'assets/heart_icon.svg',
            false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavouritesPage()),
              );
            },
          ),
          _buildNavItem(
            context,
            'assets/settings_nav_icon.svg',
            false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String assetPath, bool isActive, {bool isPlay = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
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
      ),
    );
  }
}
