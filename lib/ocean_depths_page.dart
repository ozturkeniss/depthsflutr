import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/header.dart';

class OceanDepthsPage extends StatelessWidget {
  const OceanDepthsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF001122), // Çok koyu mavi
              Color(0xFF002244), // Koyu okyanus mavisi
              Color(0xFF003366), // Orta mavi
              Color(0xFF004488), // Daha açık mavi
              Color(0xFF000000), // Siyah
            ],
            stops: [0.0, 0.2, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      // Main Icon
                      SvgPicture.asset(
                        'assets/water_icon.svg',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 30),
                      // Title
                      Text(
                        'Ocean Depths',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Explore the deep blue',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.cyan.shade300,
                        ),
                      ),
                      const SizedBox(height: 50),
                      // Content Cards
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.cyan.withOpacity(0.3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deep Sea Adventures',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Dive into the mysterious depths of the ocean. Discover hidden treasures, encounter marine life, and explore underwater caves in this immersive aquatic experience.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.cyan.shade200,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.cyan.shade600,
                                          Colors.blue.shade600,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      'Start Journey',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
