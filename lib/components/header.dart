import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';
import '../login.dart';
import '../settings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Hamburger Menu
              _buildGlowingIcon(Icons.menu, () {}),
              
              const Spacer(),
              
              // Action Buttons - 3'lü grup
              Row(
                children: [
                  _buildGlowingSVGIcon('assets/home_header_icon.svg', () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                      (route) => false,
                    );
                  }),
                  const SizedBox(width: 15),
                          _buildGlowingSVGIcon('assets/login_icon.svg', () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }),
                          const SizedBox(width: 15),
                          _buildGlowingSVGIcon('assets/settings_icon.svg', () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlowingIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.cyan.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.cyan.withOpacity(0.2),
              blurRadius: 25,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.cyan.shade300,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildGlowingSVGIcon(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.cyan.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.cyan.withOpacity(0.2),
              blurRadius: 25,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
