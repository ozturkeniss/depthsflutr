import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/header.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000B1D),
              Color(0xFF001A3A),
              Color(0xFF002D5A),
              Color(0xFF001122),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        // Settings Icon
                        SvgPicture.asset(
                          'assets/settings_icon.svg',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 30),
                        // Title
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Customize your experience',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyan.shade300,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Settings Options
                        _buildSettingsItem(
                          'Profile',
                          'assets/user_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'Notifications',
                          'assets/message_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'Privacy',
                          'assets/login_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'Security',
                          'assets/password_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'Appearance',
                          'assets/eye_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'Language',
                          'assets/message_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'Help & Support',
                          'assets/message_icon.svg',
                          () {},
                        ),
                        _buildSettingsItem(
                          'About',
                          'assets/settings_icon.svg',
                          () {},
                        ),
                        const SizedBox(height: 40),
                        // Logout Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.red.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyHomePage(),
                                ),
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, String iconPath, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.cyan.shade300,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
