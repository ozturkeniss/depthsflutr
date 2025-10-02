import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/header.dart';

class MountainPeakPage extends StatelessWidget {
  const MountainPeakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // Siyah
              Color(0xFF2C1810), // Koyu kahverengi
              Color(0xFF4A2C2A), // Orta kahverengi
              Color(0xFF8B4513), // Saddle brown
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
                        'assets/mountain_icon.svg',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 30),
                      // Title
                      Text(
                        'Mountain Peak',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Climb to the top',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange.shade300,
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
                            color: Colors.orange.withOpacity(0.3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Summit Challenge',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Conquer the highest peaks and experience breathtaking views. Navigate treacherous trails, brave the elements, and achieve the ultimate mountain climbing adventure.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange.shade200,
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
                                          Colors.orange.shade600,
                                          Colors.red.shade600,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      'Start Climb',
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
