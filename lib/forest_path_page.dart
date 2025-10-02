import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/header.dart';

class ForestPathPage extends StatelessWidget {
  const ForestPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF001100), // Çok koyu yeşil
              Color(0xFF003300), // Koyu yeşil
              Color(0xFF006600), // Orta yeşil
              Color(0xFF228B22), // Forest green
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
                        'assets/tree_icon.svg',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 30),
                      // Title
                      Text(
                        'Forest Path',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Walk through nature',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green.shade300,
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
                            color: Colors.green.withOpacity(0.3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nature\'s Sanctuary',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Immerse yourself in the tranquil beauty of ancient forests. Follow winding paths, listen to birdsong, and discover hidden waterfalls in this peaceful natural retreat.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green.shade200,
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
                                          Colors.green.shade600,
                                          Colors.teal.shade600,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      'Begin Trek',
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
